Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D88C3405851
	for <lists+linux-leds@lfdr.de>; Thu,  9 Sep 2021 15:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349454AbhIIN5H (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 09:57:07 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:48423 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237351AbhIINzr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 09:55:47 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id F0498320090C;
        Thu,  9 Sep 2021 09:54:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 09 Sep 2021 09:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        to:cc:references:from:subject:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=e
        2NWabPI043cjZ/MxTPxc2aylv7yormTp/tno/siWdw=; b=jwaBzV+ErWAx8Tt31
        l6FIAZqzIZQNZGmFS5n7idDfw88RasWwfuLisxlPsDYx0aJ3b+XBN/3GOhd9e+6k
        VqtcHO/0WZMmfdt64Cl4D7yYsBWZ1YaJzxP5nSWRl+4vxwz/7qXTWmKodZtsK4Wq
        oHHn3+IYj+BYa1I/ija9PWS0DxofPTpACallovMS7WEj0GTEErP/GehfPRLenuVh
        5E46G19DdP6pMaq0QrUhaZSaBG7amoS2XWXpa8nFPATzEP9lSpReEm6qwOfI4gY8
        Uv0tBqUYiuxGzin7M1ZLa8RGT8DtY0xNab5fc82BBBH4wLBCI+Yx/4rLJUeJtvkl
        1SlOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=e2NWabPI043cjZ/MxTPxc2aylv7yormTp/tno/siW
        dw=; b=HdSTnZpVCo++0uwD0eTCXpXhMt9jD/WziufMvXSu4FeQaZpB/lBeNEdtm
        XW8P3XUJ4ONoMEwH0LfGG1GO8J0sp/QnH+oDYaAR8iN5StIrtlAD8EyXNS1NjXwO
        gNlLk69pnCYqHOenk0c/Fy7EiIL0GVStPJ1ZBJQmSnsMo0rhB9/1IFsmqp5XXBGP
        LiACrb6zVP0rg/R/ko4zMVBsfeCKH/XBvnTP5WiVdtyUSq0gOqQ038Ja7wJT6DdQ
        SBkuBP0lFXHFjsI8kOegp5wjIRbYLyqhPs6+D3Ir1I2MxXtcG8LISObvexif4Vtl
        dxKS4vWtcdLqYajaUV5NXydE6Vouw==
X-ME-Sender: <xms:FRI6YTTFh1cQ0goHIKTFyUOEaVK15mENL9AJSaXhtFwp8qm0opS-1g>
    <xme:FRI6YUzL4Wu_VoIq7BW4SRLaxHBa9eQHvNvtCsPV68HD6DN1f_3wXoEiqKvFgEt1P
    ucybRwjudmYIlPVPQ>
X-ME-Received: <xmr:FRI6YY0vOhWW9W3e1vQHOrjUQzJwQW8NHan8z9mQqDTPDjsZ35Dt-Hkh5vqdLEx8Mn-5nkAVYPXXkXx41B5YtBLXOhr1Mx0EzX4yH-c5dYoWQ-qBDSLkrqrAsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefledgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepvfhfhffukffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepvddttdejieduudfgffevteekffegffeguddtgfefkeduvedukeff
    hedtfeevuedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:FRI6YTBZXrGx7EzPVkyNdM_VMqriBDTb47Z8GL7LXuvi-8sqQYMahA>
    <xmx:FRI6Ycjd0F0DT6Ml9jp1HkWdGNyIkuaBoFl2--pNR2FxgqjlVXY4aw>
    <xmx:FRI6YXq6dv5TnlbJDe3ff4WGjDu_UlntgEBK0KFp1yiLaQRqjZh7Eg>
    <xmx:FhI6YVUVuHtKWwcOyPIejmOvc0I90HMn9FtgbR3f5b8uixL3iXVuGg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Sep 2021 09:54:29 -0400 (EDT)
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20210902234228.32223-1-samuel@sholland.org>
 <20210902234228.32223-2-samuel@sholland.org>
 <20210903103638.5yhuvkyf62i3rp6a@gilmour>
 <70c76fe4-41e4-7232-c961-785193a68859@sholland.org>
 <20210909113628.ojbtbao7jlb6ophy@gilmour>
From:   Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 2/2] leds: sunxi: New driver for the R329/D1 LED
 controller
Message-ID: <a890e40a-7fed-de1f-ef6a-6fab414fd7ca@sholland.org>
Date:   Thu, 9 Sep 2021 08:54:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210909113628.ojbtbao7jlb6ophy@gilmour>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/9/21 6:36 AM, Maxime Ripard wrote:
> Hi,
> 
> On Sun, Sep 05, 2021 at 11:17:19PM -0500, Samuel Holland wrote:
>> Hi,
>>
>> On 9/3/21 5:36 AM, Maxime Ripard wrote:
>>> On Thu, Sep 02, 2021 at 06:42:28PM -0500, Samuel Holland wrote:
>>>> Some Allwinner sunxi SoCs, starting with the R329, contain an LED
>>>> controller designed to drive RGB LED pixels. Add a driver for it using
>>>> the multicolor LED framework, and with LEDs defined in the device tree.
>>>>
>>>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>>>> ---
>>>>  drivers/leds/Kconfig      |   8 +
>>>>  drivers/leds/Makefile     |   1 +
>>>>  drivers/leds/leds-sunxi.c | 562 ++++++++++++++++++++++++++++++++++++++
>>>>  3 files changed, 571 insertions(+)
>>>>  create mode 100644 drivers/leds/leds-sunxi.c
>>>>
>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>> index ed800f5da7d8..559d2ca0a7f4 100644
>>>> --- a/drivers/leds/Kconfig
>>>> +++ b/drivers/leds/Kconfig
>>>> @@ -297,6 +297,14 @@ config LEDS_SUNFIRE
>>>>  	  This option enables support for the Left, Middle, and Right
>>>>  	  LEDs on the I/O and CPU boards of SunFire UltraSPARC servers.
>>>>  
>>>> +config LEDS_SUNXI
>>>> +	tristate "LED support for Allwinner sunxi LED controller"
>>>> +	depends on LEDS_CLASS
>>>> +	depends on ARCH_SUNXI || COMPILE_TEST
>>>> +	help
>>>> +	  This option enables support for the LED controller provided in
>>>> +	  some Allwinner sunxi SoCs.
>>>> +
>>>
>>> Same comment for the name
>>
>> Are you concerned about the help text only, or do you also want me to rename the
>> Kconfig symbol?
> 
> The driver, the driver symbols and the Kconfig symbol would be nice
> 
>> I am happy to change the help text to something like: "This option enables
>> support for the LED controller provided in the Allwinner R329 and D1 SoCs."
>>
>> But I don't know of any satisfying way to rename the Kconfig symbol. There is no
>> general category name for "R329 and D1."
> 
> Yeah, this is not ideal, but the issue is that nothing is telling us
> whether or not it will support *only* the R329 and D1. Chances are it's
> going to be featured in a number of other SoCs in the future, so if we
> were to have the entire list of supported SoCs in the Kconfig symbol and
> driver name, we'd have to always change them everytime a new SoC support
> is introduced.

This is why I named it LEDS_SUNXI: until and unless a "v2" hardware
block shows up, this is the LED controller in all sunxi SoCs [that have
an LED controller at all]. And at that point, naming the new driver
LEDS_SUNXI_V2 makes more sense to me than trying to guess the pattern
for SoC support, where there likely is no pattern.

> It would be a pain, and it's pretty much guaranteed that someone is
> going to forget at some point. To mitigate this, we took the approach to
> use the same semantic than the DT compatible: the driver name doesn't
> really define the list of all the SoCs supported but matches every SoC
> (more or less) compatible with that SoC.

Ok, but this still doesn't tell me what you expect the driver to be
named. Again, there is no general name for "every SoC (more or less)
compatible with R329".

We tried to guess the pattern around the time H6 came out, and named a
bunch of things "sun50i" (like the IOMMU driver) that are now showing up
on sun8i (A50) and sun20i (D1) SoCs. And it turns out most of the
changes were not even new for H6 (sun50iw6), but already present in the
A63 (sun50iw3).

I'm in sort of the same situation here. I know the hardware exists on
the R329 (sun50iw11); and from looking at the A100 (sun50iw10) pinctrl
driver, I know some LED controller exists there as well. But I don't
have a manual for the A100 to verify that LED controller is compatible.
So I don't even know if R329 is the first supported SoC.

To be clear: do you want me to name the driver "sun50i_r329_ledc"?

Or maybe "sun50i_a100_ledc", since that came first and it is most likely
compatible?

Regards,
Samuel

> If you want to have the entire list in the Kconfig help though, I don't
> see anything wrong with that. Even if it goes unmaintained, it wouldn't
> really be a big deal.
> 
> Maxime
> 

