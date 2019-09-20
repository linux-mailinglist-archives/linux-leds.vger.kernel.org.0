Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF70B96B3
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2019 19:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391389AbfITRoU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Sep 2019 13:44:20 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59552 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390815AbfITRoU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Sep 2019 13:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ovMe4y08y+gJOUTLRDBs5kzt3uw/f1wh2n3/aAOTSH8=; b=TI4eCWvdrtlynBAhXhZtUpOBT
        QAaskZ2qjph7sZvTc+x8DV86O59QRR6rCD8ysQlK453rEZb2U6KhHoWrZ/HwXfSX+JSeTQCwk60iC
        GnGoiLCsT5ytQPL2zMgcw63VrpKV7/LYkjAthz6i2qoQ04wmktHLl5K/7yNYRqtEAwgO7sdlLyzTN
        15S6FrVCBqzTbxQwtOMaZpYBsm1WKjG3QpGH/VebcVMEqFux3EDt453f+YrPQaAJI6afj79/B+Imn
        vkuqKKvJYrgEijh83IY0ivaxTNNrIotpP0uXKWl4znYg26ntu8K0VPfdh820Uk7W8YXSzVsElkV+x
        Sv1SzI6QQ==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iBMx9-0001gi-Vw; Fri, 20 Sep 2019 17:44:20 +0000
Subject: Re: [PATCH v8 0/9] Multicolor FW v8 update
To:     Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com,
        pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190920174139.30079-1-dmurphy@ti.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <01ff2638-8952-e8a3-0c59-ac87f63d24c0@infradead.org>
Date:   Fri, 20 Sep 2019 10:44:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920174139.30079-1-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/20/19 10:41 AM, Dan Murphy wrote:
> Hello
> 
> Per request I removed the ops structure.  But there is a potential need for some
> device drivers to have a call back that sets the intesity of the LED color
> without modifying the hardware register.  The hardware registers are only updated
> when the brightness_set<op> is called.  The need arises with the LP50xx chip
> series where the chip has 2 control knobs to modify the output current to the
> LED.  In most cases drivers only have a single brightness register for a given
> iOUT pin.  But the LP50xx has a brightness register that controls cluster
> brightness and individual registers to control the monochrome LED intensity.
> 
> The set_color_brightness call back has been simplified in the LP50xx device
> driver so that it can cache the LED intensity in it's stack for a specific color
> as opposed to having to call back into the MC FW for the current intensity which
> made the driver complex.

"FW" historically means either firmware or firewire.
Please spell out framework in the future.

> Once the set_brightness<op> is called the driver can set the brightness and then
> set the LED intensity registers if the driver has that ability.
> 
> Dan
> 
> Dan Murphy (9):
>   leds: multicolor: Add sysfs interface definition
>   documention: leds: Add multicolor class documentation
>   dt: bindings: Add multicolor class dt bindings documention
>   dt-bindings: leds: Add multicolor ID to the color ID list
>   leds: Add multicolor ID to the color ID list
>   leds: multicolor: Introduce a multicolor class definition
>   dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
>   leds: lp50xx: Add the LP50XX family of the RGB LED driver
>   leds: Update the lp55xx to use the multi color framework


Thanks.
-- 
~Randy
