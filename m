Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 265B556DC1
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2019 17:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfFZPe4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Jun 2019 11:34:56 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45690 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbfFZPe4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Jun 2019 11:34:56 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5QFYoKV122586;
        Wed, 26 Jun 2019 10:34:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561563290;
        bh=dK1G/bNOQ6OS0Z2ejZP3H9rjyJyasJF3sJZnOOHmNRk=;
        h=To:From:Subject:Date;
        b=cJOXxujzKDbhXM7qOTyBgKyU4JsF4T/s1vDKBCEf4xyD9bUp7QWnoCY4Xggk9IN5I
         LmxeFgufscbuyq6fl83OSVOCVhkbazbYU+D2dA+c24nhyni0bbG4f4ZrEQG9xeZE94
         DYFjZEIUec6K10v5SdscZ6BhENmm2Tf9klLWlpjU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5QFYoD7044396
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Jun 2019 10:34:50 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 26
 Jun 2019 10:34:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 26 Jun 2019 10:34:50 -0500
Received: from [10.250.97.31] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5QFYnbo038873;
        Wed, 26 Jun 2019 10:34:49 -0500
To:     <devicetree@vger.kernel.org>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>, <linux-leds@vger.kernel.org>, <robh@kernel.org>,
        "Valkeinen, Tomi" <tomi.valkeinen@ti.com>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: devicetree bindings for a generic led-based backlight driver
Message-ID: <69f3a300-9e37-448d-e6fa-49c1c9ca0dd6@ti.com>
Date:   Wed, 26 Jun 2019 17:34:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

A few years ago (2015), Tomi Valkeinen posted a series implementing a 
backlight driver on top of a LED device.

https://patchwork.kernel.org/patch/7293991/
https://patchwork.kernel.org/patch/7294001/
https://patchwork.kernel.org/patch/7293981/

The discussion stopped  because he lacked the time to work on it.

I will be taking over the task and, before heading in the wrong 
direction, wanted a confirmation that the binding Tomi last proposed in 
hist last email was indeed the preferred option.

It will probably require some modifications in the LED core to create 
the right kind of led-device (normal, flash or backlight) based on the 
compatible option.

Thanks for your feedback

JJ




