Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 818ECE6AD
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 17:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728592AbfD2Pip (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 11:38:45 -0400
Received: from mail.nic.cz ([217.31.204.67]:41373 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728555AbfD2Pip (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 29 Apr 2019 11:38:45 -0400
Received: from localhost (unknown [172.20.6.125])
        by mail.nic.cz (Postfix) with ESMTPS id D9235635A6;
        Mon, 29 Apr 2019 17:38:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1556552322; bh=ouApt/jwhvcCe8DJ8g81PoNsFcLCgHBmdvsmxYHSPQU=;
        h=Date:From:To;
        b=eZTqGtfNXA5T1Hx6NY6kw/JEK1+UFblXYtLvnPT6rcVww/M/Vy+adGob8vrUxsgum
         rGUVQjl8+JYbtbBLZh1qNvON+vXfgEHgvDft6gr5zZ4JZpvmcmUDYDAw+SHK0+ELMT
         Bfv3zO9n8LOjMMqello2tTh90sNIBmi7mu1WONkE=
Date:   Mon, 29 Apr 2019 17:38:42 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Subject: Re: linux-next: Tree for Apr 29 (drivers/leds/leds-turris-omnia)
Message-ID: <20190429173842.06f02852@nic.cz>
In-Reply-To: <20190429153200.GA11761@amd>
References: <20190429190354.0d5e2e93@canb.auug.org.au>
 <d3822785-0683-28df-ffa6-ab679aa27c73@infradead.org>
 <20190429153200.GA11761@amd>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.99.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

I am sending patch only adding the I2C dep. Theoretically it is
possible that someone uses the same I2C API in their microcontroller on
another architecture.

On Mon, 29 Apr 2019 17:32:00 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> On Mon 2019-04-29 08:03:02, Randy Dunlap wrote:
> > On 4/29/19 2:03 AM, Stephen Rothwell wrote:  
> > > Hi all,
> > > 
> > > Changes since 20190426:
> > >   
> > 
> > on i386:
> > 
> > when CONFIG_LEDS_TURRIS_OMNIA=y and CONFIG_I2C=m:
> > 
> > Probably should also depend on I2C.
> > 
> > 
> > ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_remove':
> > leds-turris-omnia.c:(.text+0xb): undefined reference to `i2c_smbus_write_byte_data'
> > ld: drivers/leds/leds-turris-omnia.o: in function `omnia_led_brightness_set_blocking':
> > leds-turris-omnia.c:(.text+0x62): undefined reference to `i2c_smbus_write_byte_data'
> > ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_probe':
> > leds-turris-omnia.c:(.text+0x1d8): undefined reference to `i2c_smbus_write_byte_data'
> > ld: leds-turris-omnia.c:(.text+0x1f6): undefined reference to `i2c_smbus_write_byte_data'
> > ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_driver_init':
> > leds-turris-omnia.c:(.init.text+0x8): undefined reference to `i2c_register_driver'
> > ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_driver_exit':
> > leds-turris-omnia.c:(.exit.text+0x6): undefined reference to `i2c_del_driver'  
> 
> Ack.
> 
> It can also depend on ARM or even specific ARM soc... unless we are
> compile testing. This is for specific router...
> 
> 									Pavel

