Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F159134A16A
	for <lists+linux-leds@lfdr.de>; Fri, 26 Mar 2021 07:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhCZGHt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Mar 2021 02:07:49 -0400
Received: from smtp2.axis.com ([195.60.68.18]:34164 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229551AbhCZGH1 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Mar 2021 02:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616738848;
  x=1648274848;
  h=from:to:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=E6eNUZQ3KpEv15NAH6e1EpXfcFRADmQJHhYR5BoWcx8=;
  b=G2cNr1+W0QcdHrfbMXYd5SkVZJMSs7b1+dC9vN14e+jMJKUY0ifRu90W
   5IxHV+xLwMBe/RnPIjqtOSZ8Kx0/6oxRv04FtfGPms80U088FJdxeZvaq
   xP7iLA0GWcJqIbcHAoVGL1fuyD1TK/hT52OfZf7Av8mNdy06DS0o1XsQW
   KqP9Qva1Hzx0+0kHCy0cVLAe8JAuibDM5lVVkZBRoOtkW4QVmg0p+dM+B
   i2i+WAU0i5iKof/48SXVs++kBvjPDDR9WpjokiCMXLXabIVR3PDPU7yLJ
   lIu9zljLZWgE5qcUtxlxdZ01HJJrpyaxmDuSPIefDaNCm9wom2oP2VlQo
   Q==;
From:   Hermes Zhang <Hermes.Zhang@axis.com>
To:     "pavel@ucw.cz" <pavel@ucw.cz>, "dmurphy@ti.com" <dmurphy@ti.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hermes Zhang <Hermes.Zhang@axis.com>,
        "lkml@axis.com" <lkml@axis.com>, kernel <kernel@axis.com>
Subject: Re: [PATCH v2 2/2] leds: leds-multi-gpio: Add multiple GPIOs LED
 driver
Thread-Topic: [PATCH v2 2/2] leds: leds-multi-gpio: Add multiple GPIOs LED
 driver
Thread-Index: AQHXIgDn9WkVNzIcREGb9FBG0Jikcw==
Date:   Fri, 26 Mar 2021 06:07:26 +0000
Message-ID: <05c93a739a404e3cb181802619258674@XBOX01.axis.com>
References: <20210326052801.17666-1-chenhui.zhang@axis.com>
 <20210326052801.17666-3-chenhui.zhang@axis.com>
 <20210326055559.izdyzb5gwgwthv4i@falbala.internal.home.lespocky.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 3/26/21 1:56 PM, Alexander Dahl wrote:=0A=
>> +=0A=
>> +module_platform_driver(multi_gpio_led_driver);=0A=
>> +=0A=
>> +MODULE_AUTHOR("Hermes Zhang <chenhui.zhang@axis.com>");=0A=
>> +MODULE_DESCRIPTION("Multiple GPIOs LED driver");=0A=
>> +MODULE_LICENSE("GPL v2");=0A=
>> +MODULE_ALIAS("platform:leds-multi-gpio");=0A=
> I did not review thouroughly, but in my mail the indentation looks=0A=
> wrong. Did checkpatch complain?=0A=
=0A=
Sorry, I forgot to check the style before commit, but seems one problem=0A=
about extra space:=0A=
=0A=
$ chkernel=0A=
ERROR: space prohibited before that ',' (ctx:WxW)=0A=
#164: FILE: drivers/leds/simple/leds-multi-gpio.c:76:=0A=
+            + sizeof(u8) * nr_states , GFP_KERNEL);=0A=
                                                   ^=0A=
=0A=
I will fix it in next commit.=0A=
=0A=
=0A=
Best Regards,=0A=
=0A=
Hermes=0A=
=0A=
=0A=
