Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB36E5AF
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 17:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728445AbfD2PDG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 11:03:06 -0400
Received: from merlin.infradead.org ([205.233.59.134]:53906 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbfD2PDG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Apr 2019 11:03:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=EYiXfmLoKHxAWfC8uD0fsXaQI31Edasjuth75pr3LrU=; b=jzMvSG4lmb2GY7MPD59DhR6dZ+
        P4jP3hKdbGO699/PlRcA5XBFsJ2QCmYj9TVnXL12Rs1x7gcwbyE/Jn9U/LzFpkeKZ2gQuooGkHjZB
        Q8VMHRr2T0S/FPe5vzJyAdtOVe0L4B5ieCKdFQI03GEdfBYvBwU5a3dkiB8q5ludpQuM+O91CR1XU
        Rpwq7dufPJ7hcJYLknVKM6HRWhZCv6p8irwXuUpWOcki+SufX8zHls9U57TcWiXCZAvsAI6dxD73/
        jIhtNeajBJ02UbLR6NGgt7FlO6Z4Di6bZIehRt266pPlYn0AHgJAI2s6O+o57Z3uQEj73ILsmmrg3
        G1Oi1+Vg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hL7o7-0000cH-QD; Mon, 29 Apr 2019 15:03:04 +0000
Subject: Re: linux-next: Tree for Apr 29 (drivers/leds/leds-turris-omnia)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marek Behun <marek.behun@nic.cz>, linux-leds@vger.kernel.org
References: <20190429190354.0d5e2e93@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d3822785-0683-28df-ffa6-ab679aa27c73@infradead.org>
Date:   Mon, 29 Apr 2019 08:03:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429190354.0d5e2e93@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 4/29/19 2:03 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190426:
> 

on i386:

when CONFIG_LEDS_TURRIS_OMNIA=y and CONFIG_I2C=m:

Probably should also depend on I2C.


ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_remove':
leds-turris-omnia.c:(.text+0xb): undefined reference to `i2c_smbus_write_byte_data'
ld: drivers/leds/leds-turris-omnia.o: in function `omnia_led_brightness_set_blocking':
leds-turris-omnia.c:(.text+0x62): undefined reference to `i2c_smbus_write_byte_data'
ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_probe':
leds-turris-omnia.c:(.text+0x1d8): undefined reference to `i2c_smbus_write_byte_data'
ld: leds-turris-omnia.c:(.text+0x1f6): undefined reference to `i2c_smbus_write_byte_data'
ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_driver_init':
leds-turris-omnia.c:(.init.text+0x8): undefined reference to `i2c_register_driver'
ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_driver_exit':
leds-turris-omnia.c:(.exit.text+0x6): undefined reference to `i2c_del_driver'



-- 
~Randy
