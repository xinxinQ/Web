﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;

namespace wojilu.Test.Data {


    [TestFixture]
    public class MemoryDBGeneric {





        [Test]
        public void testFindById() {
            Book book = cdb.findById<Book>( 5 );
            Assert.IsNotNull( book );
            Assert.AreEqual( "zhangsan5", book.Name );

            Book nullBook = cdb.findById<Book>( 999999999 );
            Assert.IsNull( nullBook );
        }

        [Test]
        public void testFindAll() {

            IList<Book> list = cdb.findAll<Book>();
            Assert.AreEqual( 10, list.Count );
        }

        // 每次FindAll 得到的，都是缓存的副本，
        // 并且 book.Delete() 只是移除缓存中的数据，对当前的副本(集合)并无影响
        [Test]
        public void testDeleteAll() {

            IList<Book> all = cdb.findAll<Book>();

            foreach (Book book in all) {
                cdb.delete( book );
            }

            int result = cdb.findAll<Book>().Count;

            Assert.AreEqual( result, 0 );
        }

        // 随机删除
        [Test]
        public void testDelete() {
            Random rd = new Random();

            for (int i = 0; i < 20; i++) {
                int id = rd.Next( 1, 11 );
                Console.WriteLine( "随机ID:" + id );
                Book book = cdb.findById<Book>( id );
                if (book != null) {
                    cdb.delete( book );
                    Console.WriteLine( "删除：" + id );
                }
            }

        }

        [Test]
        public void testDelete3() {

            IList<Book> all = cdb.findAll<Book>();
            Assert.AreEqual( 10, all.Count );

            int deleteCount = 0;
            int bookCount = all.Count;
            for (int i = 0; i < bookCount; i++) {
                cdb.delete( all[i] );
                deleteCount++;
            }

            Assert.AreEqual( bookCount, deleteCount );

            IList<Book> results = cdb.findAll<Book>();
            Assert.AreEqual( 0, results.Count );
        }


        // findBy (index test)
        //----------------------------------------------------------------------------------------------

        [Test]
        public void testFindBy() {

            IList<Book> books = cdb.findBy<Book>( "Name", "zhangsan5" );
            Assert.AreEqual( 1, books.Count );
            Book book = books[0];
            Assert.AreEqual( "hao10", book.Weather );

            IList<Book> books2 = cdb.findBy<Book>( "Weather", "hao10" );
            Assert.AreEqual( 1, books2.Count );
            Book book2 = books2[0];
            Assert.AreEqual( "zhangsan5", book2.Name );
        }

        [Test]
        public void testFindBy_Insert() {

            Book newBook = new Book {
                Name = "zhangsan5",
                Weather = "hao6"
            };
            cdb.insert( newBook );

            IList<Book> newBooks = cdb.findBy<Book>( "Name", "zhangsan5" );
            Assert.AreEqual( 2, newBooks.Count );
            Assert.AreEqual( "hao6", newBooks[1].Weather );

            IList<Book> newBooks2 = cdb.findBy<Book>( "Weather", "hao6" );
            Assert.AreEqual( 2, newBooks2.Count );
            Assert.AreEqual( "zhangsan5", newBooks2[1].Name );

        }

        [Test]
        public void testFindBy_Update() {

            IList<Book> books = cdb.findBy<Book>( "Name", "zhangsan5" );
            Assert.AreEqual( 1, books.Count );
            Book book = books[0];

            book.Name = "zhangsan8";
            cdb.update( book );

            IList<Book> newBooks = cdb.findBy<Book>( "Name", "zhangsan5" );
            Assert.AreEqual( 0, newBooks.Count );

            IList<Book> newBooks2 = cdb.findBy<Book>( "Name", "zhangsan8" );
            Assert.AreEqual( 2, newBooks2.Count );
        }

        [Test]
        public void testFindBy_Delete() {

            IList<Book> books = cdb.findBy<Book>( "Name", "zhangsan5" );
            Assert.AreEqual( 1, books.Count );
            Book book = books[0];

            cdb.delete( book );

            IList<Book> newBooks = cdb.findBy<Book>( "Name", "zhangsan5" );
            Assert.AreEqual( 0, newBooks.Count );

            int allCount = cdb.findAll<Book>().Count;
            Assert.AreEqual( 9, allCount );

        }

        [SetUp]
        public void initData() {
            Console.WriteLine( "------------------------------init data-------------------------------" );
            for (int i = 0; i < 10; i++) {
                Book book = new Book();
                book.Name = "zhangsan" + (i + 1);
                book.Weather = "hao" + ((i + 1) * 2);
                cdb.insert( book );
            }
        }

        [TearDown]
        public void deleteAll() {
            IList<Book> all = cdb.findAll<Book>();

            foreach (Book book in all) {
                cdb.delete( book );
            }

        }


        [Test]
        public void testMenuParentId() {

            List<MenuMock> oldList = cdb.findAll<MenuMock>();
            foreach (MenuMock menuMock in oldList) {
                menuMock.delete();
            }

            for (int i = 0; i < 20; i++) {
                MenuMock menu = new MenuMock();
                menu.Name = "menu" + i;
                menu.insert();
            }


            for (int i = 0; i < 20; i++) {
                MenuMock menu = new MenuMock();
                menu.Name = "menu" + i;
                menu.ParentId = i + 1;
                menu.insert();
            }


            List<MenuMock> list = cdb.findAll<MenuMock>();
            Assert.AreEqual( 40, list.Count );

            Tree<MenuMock> _tree = new Tree<MenuMock>( list );
            var children = _tree.FindChildren( 3 );
            Assert.AreEqual( 1, children.Count );
            Assert.AreEqual( 23, children[0].getNode().Id );

        }

    }
}
