Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9CE5EE28B
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2019 15:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbfKDOcI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Nov 2019 09:32:08 -0500
Received: from smtp.220.in.ua ([89.184.67.205]:49433 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727838AbfKDOcI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 4 Nov 2019 09:32:08 -0500
Received: from [192.168.100.196] (unknown [12.1.77.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 2913A1A2463F;
        Mon,  4 Nov 2019 16:32:03 +0200 (EET)
Subject: Re: [RESEND PATCH] leds: mlxreg: Fix possible buffer overflow
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
References: <20191016072430.27020-1-oleg@kaa.org.ua>
 <20191104090927.GD12355@duo.ucw.cz>
From:   Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <a7344a9c-c264-d28f-9e64-9c30557b62b1@kaa.org.ua>
Date:   Mon, 4 Nov 2019 16:31:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191104090927.GD12355@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel,

On 04.11.19 11:09, Pavel Machek wrote:
> On Wed 2019-10-16 10:24:30, Oleh Kravchenko wrote:
>> Error was detected by PVS-Studio:
>> V512 A call of the 'sprintf' function will lead to overflow of
>> the buffer 'led_data->led_cdev_name'.
>>
>> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Acked-by: Pavel Machek <pavel@ucw.cz>
>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> Thanks for resend, and sorry for the delay.
>
> Note that this would only be security issue if someone did malicious
> device tree... so... not a security issue :-).

Agree, very limited case.
But I just want make our kernel more robust and reliable :-)

>
> Applied.
Thanks!
> 								Pavel
