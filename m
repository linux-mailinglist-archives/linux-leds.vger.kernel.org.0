Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18A647B225
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jul 2019 20:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730167AbfG3Skb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Jul 2019 14:40:31 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40652 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727599AbfG3Ska (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Jul 2019 14:40:30 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6UIeQX7125454;
        Tue, 30 Jul 2019 13:40:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564512026;
        bh=eGM+rs0hw6Wk2bnhRDKqKyJtphA0ZHwBzB5fx++9ViU=;
        h=To:From:Subject:Date;
        b=hCM1ozrMs9ikzKI+b9IVe0DbCJv0u7Wt7reEPxiY8xkhBBjY3jiaN8m3s2R+Rxx9q
         SQYoL30zuN6Sv5PVlPEu3kyGbn4BOy1xPyf48dqLX6Rd7JX2iwfRZ9TVVWX7myaTwg
         xO6lyyOSxZHsskt9uPuH0vaLVvvfMO/w1W7RwV9c=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6UIeQ2D019200
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Jul 2019 13:40:26 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Jul 2019 13:40:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Jul 2019 13:40:25 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6UIeP7h027907;
        Tue, 30 Jul 2019 13:40:25 -0500
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>
From:   Dan Murphy <dmurphy@ti.com>
Subject: LEDs next branch
Message-ID: <99b075d0-e230-35bc-06c5-712a69fab91d@ti.com>
Date:   Tue, 30 Jul 2019 13:40:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

Did you see/fix this on the led-next branch?

I saw this when booting trying to fix the lm3532

[    8.651461] led_class: exports duplicate symbol 
devm_led_classdev_register_ext (owned by kernel)

[    8.730063] led_class: exports duplicate symbol 
devm_led_classdev_register_ext (owned by kernel)


Dan

