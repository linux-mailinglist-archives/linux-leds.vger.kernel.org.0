Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 598F222B873
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jul 2020 23:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgGWVR7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jul 2020 17:17:59 -0400
Received: from mail.nic.cz ([217.31.204.67]:45624 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726807AbgGWVR7 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 23 Jul 2020 17:17:59 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 3E49A140A3D;
        Thu, 23 Jul 2020 23:17:56 +0200 (CEST)
Date:   Thu, 23 Jul 2020 23:17:55 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] leds: add orange color
Message-ID: <20200723231755.6b6476c0@nic.cz>
In-Reply-To: <20200723210452.c63oup3k7w4icqc6@duo.ucw.cz>
References: <20200723125751.4045-1-marek.behun@nic.cz>
        <20200723193908.GA26165@amd>
        <57981a86-dd1b-09ee-8035-4c84d4c990df@gmail.com>
        <30b1f173-c687-9fe2-92bd-fc53f776cb77@gmail.com>
        <20200723201657.nb5dm2aqmjnizmpq@duo.ucw.cz>
        <8b36be51-3a75-458d-4fed-d730621e1547@gmail.com>
        <20200723203953.iijldzbnfqh36mex@duo.ucw.cz>
        <854ee2f0-4dd1-b665-f216-bff33ab3b571@gmail.com>
        <20200723210452.c63oup3k7w4icqc6@duo.ucw.cz>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 23 Jul 2020 23:04:52 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> > > ...but really, unless there's device where there are leds of
> > > yellow/orange color... it may be easier to keep the current list.  
> > 
> > Yellow has been available since the inception of the led_colors array,
> > so if we have that, then why we should not have orange?  
> 
> I fear people will confuse yellow and orange.

LOL, so I looked into schematics and the manufacturer of the ethernet
port cage calls the LED yellow. So apparently I confused it with
orange... :D

http://www.link-pp.com/?product/201807116277.html
see LED Option in the table

