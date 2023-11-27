Return-Path: <linux-leds+bounces-175-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4278A7F9CC6
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 10:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEEC7B20D1B
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 09:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023B416418;
	Mon, 27 Nov 2023 09:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CetYnMam"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AA113AEB;
	Mon, 27 Nov 2023 09:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBBFC433C8;
	Mon, 27 Nov 2023 09:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701077871;
	bh=FR/to59+EYS4LPaU5QDZLcTso2dRiNMSCNN4xJ+xCL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CetYnMamkqCDJwOzWIgP0MT9mgSh7aa+oh1OdsGvljfTzpvEqeekfaSYbjfTD8bXB
	 6NRa4i3kBwK4b/PGeT/28r28i+zG9mvGO6p1B7XKzApmOwgfT+vE4d5F7Lk3abJ0os
	 NOSiVGlAnsjkQXYuRcr3MPZNDpKGOKCZeajgS89Jaj6RXWGXzUS5soMtzbwurUL7W3
	 CwhXnZaQjIUZ6rrrF/TQXh+lVvXK1PdfqLjjJy/8WXRaMLhBN5kYsXYcQBwz9S3Q1M
	 vRr32CVKMNWkjdbOmCizOk7WzptMINlcGAXkwsJ13DtuQ6yXvMjrm5cD2lleZlKVXe
	 p9+0nLLkxsSXw==
Date: Mon, 27 Nov 2023 09:37:46 +0000
From: Lee Jones <lee@kernel.org>
To: GaryWang =?utf-8?B?5rGq5LmL6YC4?= <GaryWang@aaeon.com.tw>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"larry.lai" <larry.lai@yunjingtech.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"pavel@ucw.cz" <pavel@ucw.cz>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"musa.lin@yunjingtech.com" <musa.lin@yunjingtech.com>,
	"jack.chang@yunjingtech.com" <jack.chang@yunjingtech.com>,
	"noah.hung@yunjingtech.com" <noah.hung@yunjingtech.com>
Subject: Re: [PATCH V7 1/3] mfd: Add support for UP board CPLD/FPGA
Message-ID: <20231127093746.GG1470173@google.com>
References: <20231031015119.29756-1-larry.lai@yunjingtech.com>
 <20231031015119.29756-2-larry.lai@yunjingtech.com>
 <ZVOABz35C8KmGrrk@smile.fi.intel.com>
 <SI2PR02MB56825A2D306E4358E33FBEC5EEB8A@SI2PR02MB5682.apcprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SI2PR02MB56825A2D306E4358E33FBEC5EEB8A@SI2PR02MB5682.apcprd02.prod.outlook.com>

On Fri, 24 Nov 2023, GaryWang 汪之逸 wrote:

> Hi Andy,
> 
>         Thank you for review the V7 patch and sorry for my poor English, for your question, please kindly to check our comments with ">>" beginning.

Please fix your mail client instead.  Or use a different one.

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Tuesday, November 14, 2023 10:11 PM
> To: larry.lai <larry.lai@yunjingtech.com>
> Cc: lee@kernel.org; linus.walleij@linaro.org; pavel@ucw.cz; linux-kernel@vger.kernel.org; linux-gpio@vger.kernel.org; linux-leds@vger.kernel.org; GaryWang 汪之逸 <GaryWang@aaeon.com.tw>; musa.lin@yunjingtech.com; jack.chang@yunjingtech.com; noah.hung@yunjingtech.com
> Subject: Re: [PATCH V7 1/3] mfd: Add support for UP board CPLD/FPGA

No headers in the body please.

> On Tue, Oct 31, 2023 at 09:51:17AM +0800, larry.lai wrote:
> > The UP Squared board
> > <http://www.upboard.com/> implements certain features (pin control, onboard LEDs or CEC) through an on-board CPLD/FPGA.
> >
> > This driver implements the line protocol to read and write registers
> > from the FPGA through regmap. The register address map is also included.
> >
> > The UP Boards provide a few I/O pin headers (for both GPIO and
> > functions), including a 40-pin Raspberry Pi compatible header.
> >
> > This patch implements support for the FPGA-based pin controller that
> 
> s/This patch implements/Implement/
> 
> > manages direction and enable state for those header pins.
> >
> > Partial support UP boards:
> 
> "for UP" or "supported" (choose one).
> 
> > * UP core + CREX
> > * UP core + CRST02
> 
> > Reported-by: kernel test robot <lkp@intel.com>
> 
> No, this tag can't be applied to the new code.
> 
> > Signed-off-by: Gary Wang <garywang@aaeon.com.tw>
> > Signed-off-by: larry.lai <larry.lai@yunjingtech.com>
> 
> Missing Co-developed-by?
> >> larry is our consultant for upstream

This is confusing.  More '>'s usually means deeper quotes.

Your reply should be up against the left wall, like this one.

> ...
> 
> > +config MFD_INTEL_UPBOARD_FPGA
> 
> I believe Intel has nothing to do with this one. The Intel SoC is accompanied with OEM FPGA, right?
> >> we used Intel CPLD Altera MAX V/X for pin mux and provide more driving power for Raspberry Pi compatible HAT pins, will remove "INTEL"

Please enable line-wrap.

> > +     tristate "Support for the Intel platform foundation kit UP board FPGA"
> 
> Depends on the above this most likely to be updated.
> >> ok

If you agree with a comment, please trim it from your reply.

[...]

-- 
Lee Jones [李琼斯]

