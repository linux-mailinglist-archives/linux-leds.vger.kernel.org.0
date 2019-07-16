Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10D4E6B081
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jul 2019 22:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729076AbfGPUfX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Jul 2019 16:35:23 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:39773 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388588AbfGPUfX (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 16 Jul 2019 16:35:23 -0400
Received: from [192.168.23.137] (unknown [209.49.55.10])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 736031A200E3;
        Tue, 16 Jul 2019 23:35:18 +0300 (EEST)
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
References: <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
 <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>
 <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
 <94968b55-a9cc-277e-ac25-bf765f9db138@kaa.org.ua>
 <e1fc84a1-75e4-6c56-d2ea-f6ade28087ac@kaa.org.ua>
 <e4e0223d-c463-e767-12b2-7e360eac000b@gmail.com>
 <38050529-5730-6e88-fe1a-909492711dd0@kaa.org.ua>
 <8f658d57-5079-ad76-ce3e-af3d031b4685@gmail.com> <20190611120156.GA1161@amd>
 <9e812391-56e9-2dd5-1f08-435df717b12b@gmail.com>
 <8d0d6893-212c-41c4-fef8-76417eb45399@kaa.org.ua>
 <7d71e2a7-5dcf-7dd8-71a7-eee5c07fb1d0@gmail.com>
From:   Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <e930e20e-e901-5349-c567-c33229564719@kaa.org.ua>
Date:   Tue, 16 Jul 2019 23:35:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <7d71e2a7-5dcf-7dd8-71a7-eee5c07fb1d0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Thank you for advice!

16.07.19 21:41, Jacek Anaszewski пише:
> Hi Oleh,
>
> On 7/9/19 12:00 AM, Oleh Kravchenko wrote:
>>
>> I just figure out that this Pipe LED actually consist from 5 LEDs, not 3 :)
>> And supports next level 'brightness' from SPI driver:
>> - '0' Off
>> - '1' On
>> - '2' Cascade (waterfall down)
>>  -'3' InverseCascade (waterfall up)
>> - '4' Bounce
>> - '5' InverseBounce
>>
>> Please advice, can I proceed with sys attribute file to set '2'..'5' levels?
> It looks like pattern trigger is the most appropriate solution for the
> effects 2-5. Your driver will need to implement pattern_set op for the
> LEDs supporting the effects, and then the effect will be enabled after
> writing required sequence to the hw_pattern file. You will need to come
> up with a sequence of values that the driver will recognize as a request
> of enabling given hardware effect. Please compare
> drivers/leds/leds-sc27xx-bltc.c and its ABI documentation [0] for
> reference. See also hw_pattern file description in [1].
>
> [0] Documentation/ABI/testing/sysfs-class-led-driver-sc27xx
> [1] Documentation/ABI/testing/sysfs-class-led-trigger-pattern
>
