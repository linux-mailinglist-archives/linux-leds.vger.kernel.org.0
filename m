Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F17DD45545
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2019 09:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfFNHKj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Jun 2019 03:10:39 -0400
Received: from mail.thorsis.com ([92.198.35.195]:45998 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbfFNHKj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 14 Jun 2019 03:10:39 -0400
X-Greylist: delayed 486 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Jun 2019 03:10:38 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 9275A477B;
        Fri, 14 Jun 2019 09:05:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id n4hKxe5O_F5z; Fri, 14 Jun 2019 09:05:39 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id BE7913DD3; Fri, 14 Jun 2019 09:05:37 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=unavailable autolearn_force=no version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     linux-leds@vger.kernel.org
Cc:     Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] Multicolor Framework update
Date:   Fri, 14 Jun 2019 09:02:23 +0200
Message-ID: <55737098.K72IVJ5cDM@ada>
In-Reply-To: <20190523190820.29375-1-dmurphy@ti.com>
References: <20190523190820.29375-1-dmurphy@ti.com>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Dan,

Am Donnerstag, 23. Mai 2019, 14:08:11 CEST schrieb Dan Murphy:
>   leds: multicolor: Add sysfs interface definition
>   dt: bindings: Add multicolor class dt bindings documention
>   documention: leds: Add multicolor class documentation
>   dt-bindings: leds: Add multicolor ID to the color ID  list
>   leds: Add multicolor ID to the color ID list
>   leds: multicolor: Introduce a multicolor class definition
>   dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
>   leds: lp50xx: Add the LP50XX family of the RGB LED driver
>   leds: Update the lp55xx to use the multi color framework

While not having much experience with the implementation of the LED subsystem, 
I've had a short look at those. Curious question: would it be possible to take 
three gpio-leds and group those together to one multicolor-led? I know at 
least one board, where things are wired up like this, see e.g. 
at91-sama5d27_som1_ek.dts

Greets
Alex

