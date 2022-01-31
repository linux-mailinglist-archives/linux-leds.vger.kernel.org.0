Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5479E4A3EE9
	for <lists+linux-leds@lfdr.de>; Mon, 31 Jan 2022 09:56:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbiAaI4B (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 31 Jan 2022 03:56:01 -0500
Received: from mail.schwermer.no ([49.12.228.226]:55784 "EHLO
        mail.schwermer.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbiAaI4B (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 31 Jan 2022 03:56:01 -0500
Message-ID: <16e48f33-2a69-ad59-3fd5-f1e25f46e413@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1643619359;
        bh=T3ma9mCJ2JsuAY8MDWeX8vBvjjws4kKntfplZ2nV6MM=;
        h=Subject:To:References:From:In-Reply-To;
        b=lI3cXfJRzWRlYWJ3B+Yy6JJUIrdZgvNze28eVelKDqbqrDYzn8l1EQbJSMoYD6ELp
         lMG1R2SWrubOCeeSwT6Nhs308B4EcNeIkDPxr4GzWxOYUjR/oi1xd0vZOiYLBv5EYj
         n95kHHHoenyQLstL5Yr9i6VSBIkTf89AH1fbWAbFjK+ULcYBlXFArckpAFV3lY3q4F
         4W7Z866qnNex5z7pKBkSX34+i1MOV0o3UoT5HOJZwDtbN245TZPCfrBl6sm+VtxUQ2
         9nCpebFKPw0v1b4o7rw9exB2Fw+YYjcavm7pe36KXkxBI+BTgQjIwP48RlCvHOUrnA
         m+gWrO0sOShHA==
Date:   Mon, 31 Jan 2022 09:55:58 +0100
Mime-Version: 1.0
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add multicolor PWM LED bindings
Content-Language: en-US
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>, pavel@ucw.cz,
        linux-leds@vger.kernel.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
        post@lespocky.de
References: <20220126104844.246068-1-sven@svenschwermer.de>
 <20220126104844.246068-2-sven@svenschwermer.de>
 <00d8de09-360e-4e0f-1496-642ba1cbf863@gmail.com>
 <20220128213609.7a60e9fe@thinkpad>
 <09b46d05-5dd0-a585-2ca3-0bc04e613343@gmail.com>
 <20220129002639.33c7d4c0@thinkpad>
 <YfeLTxVAmwjU6PFr@ada-deb-carambola.ifak-system.com>
From:   Sven Schwermer <sven@svenschwermer.de>
In-Reply-To: <YfeLTxVAmwjU6PFr@ada-deb-carambola.ifak-system.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 1/31/22 08:10, Alexander Dahl wrote:
>> I know that color curves were being discussed at the time multicolor
>> was being introduced, and AFAIK Pavel didn't like it, but I don't
>> remember the reasons anymore.
>>
>> As far as I understand it though, for PWM LEDs there is an equation for
>> gamma correction.
> 
> That's right, and it gets a little more complicated if you have RGB
> instead of a single LED.  A start for reading might be this:
> 
> https://hackaday.com/2016/08/23/rgb-leds-how-to-master-gamma-and-hue-for-perfect-brightness/
> 
> (I had bookmarked that back when I was hacking on firmware for an 8bit
> microcontroller controlling an RGB LED through soft PWM few years
> ago.  A very simple solution is a precalculated static lookup table.)

This is a very interesting topic which I was gonna ask about on this 
list anyways. IMHO, the Linux leds subsystem needs a uniform way to deal 
with lightness/gamma correction. There is some previous work in pwm_bl 
and led_bl with their `brightness-levels` device tree property and 
cie1931 correction function (drivers/video/backlight/pwm_bl.c). It would 
be very nice to have this functionality in the led class. Having 
something similar for multi-color as well would be fantastic.

Sven
