Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54EC72D777E
	for <lists+linux-leds@lfdr.de>; Fri, 11 Dec 2020 15:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390916AbgLKOKt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Fri, 11 Dec 2020 09:10:49 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:42574 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388412AbgLKOKX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 11 Dec 2020 09:10:23 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-275-kWrRaaEqM2GA87qFJEGMYA-1; Fri, 11 Dec 2020 14:08:44 +0000
X-MC-Unique: kWrRaaEqM2GA87qFJEGMYA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 11 Dec 2020 14:08:43 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Fri, 11 Dec 2020 14:08:43 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Marek Behun' <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>
CC:     "pavel@ucw.cz" <pavel@ucw.cz>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Abanoub Sameh <abanoubsameh@protonmail.com>,
        kernel test robot <lkp@intel.com>
Subject: RE: [PATCH] leds: led-core: Get rid of enum led_brightness
Thread-Topic: [PATCH] leds: led-core: Get rid of enum led_brightness
Thread-Index: AQHWz72dXrZzdGUzlUiXyjL6e22ikqnx7D2g
Date:   Fri, 11 Dec 2020 14:08:43 +0000
Message-ID: <2ae41868b2604a489927b5903529afb4@AcuMS.aculab.com>
References: <20201211014840.1554095-1-abanoubsameh@protonmail.com>
 <20201211135628.1fe1af79@nic.cz>
In-Reply-To: <20201211135628.1fe1af79@nic.cz>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Marek Behun
> Sent: 11 December 2020 12:56
> 
> On Fri, 11 Dec 2020 03:48:40 +0200
> Abanoub Sameh <abanoubsameh8@gmail.com> wrote:
> 
> > This gets rid of enum led_brightness in the main led files,
> > because it is deprecated, and an int can be used instead,
> > or maybe even a uint8_t since it only goes up to 255.
> > Next we can also patch the other files to get rid of it completely.
> 
> 1. unsigned int should be used IMO
>   - using int may force all implementers to check for negative value
>     and return -EINVAL, which is stupid
>   - some LED controllers may offer more than 8bit brightness value, so
>     no uint8_t

More than 8 bits would be good.
While not really relevant for actual 'brightness' it allows
for 'strange' things be encoded in the brightness field.

For instance we have some hardware that has RGB leds on it.
They are a single device so it really needs a colour property.
But it is more complex than that, between the driver and LED
there is an FPGA - so it can modulate the LED output in many ways.
As well as using PWM to change the brightness and (eg) 1/2HZ flashing
it is possible to alternate between red and green to get a reasonable
orange (works better than driving both at the same time!).

There is also the option of making the led follow some internal
signal rather then be directly driven by the driver.

While extra parameters could be added, they are only really usable
by code that knows they are present.
So encoding in the 'brightness' sort of makes sense.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

