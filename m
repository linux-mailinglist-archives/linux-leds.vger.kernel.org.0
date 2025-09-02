Return-Path: <linux-leds+bounces-5355-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB80B3FC55
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 12:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42D644E3136
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 10:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD33283129;
	Tue,  2 Sep 2025 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mu7vfGrO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B91280309;
	Tue,  2 Sep 2025 10:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756808802; cv=none; b=eoAb45TeiyljcazfG+hwgGC8xn+0g13stakI/1qJTyRlds4sZwosFHrLybSe58+NPR+/CX/39T+TGv0Lk/YnbfbmjsMY7kSJZwA3bve+xOvCsuvHeEs5jw8bwd56HCJlEGyEZpFBszdj8okLPLgS9H0So1ZdJ61EugZyX6leFPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756808802; c=relaxed/simple;
	bh=lToFDrcgaN9qTLhM+wiTddSLncDaBi7MkVCs9D8u8nA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrZALjuoJtRUGU7aEwkczn5XAIqOab2aRlHUdhGKV8KWDJYZAaJAjGL0IDhBsGk7ZTO3Np4wiVznkRPYczy6q5Pa1clrDcdRcykPE1FJgT7Qz7sZNkzQyzzJ0BmTDbSs3dA4uWEGE0mnt59mPUCRvLAarz3mr58QNBghoxmp8oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mu7vfGrO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACA0C4CEED;
	Tue,  2 Sep 2025 10:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756808801;
	bh=lToFDrcgaN9qTLhM+wiTddSLncDaBi7MkVCs9D8u8nA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mu7vfGrO9HoMK2J+ETopLTQqJt/Ku5I5gDUIi1Q9FOhHe3A4wKW2p+i6h0+7/yVOM
	 VF0vv3lXYFrihh/dzfR2XvV0gSY4Hk+f9CaQDH4pUJYZCfAAMILZS/+/7K+tGoZAdY
	 GuAZlz32I66tuhpm61FimNXeF5uHcRUODQKem5hPtIVa5+Whi8R/JXy1KBUmlKS2m/
	 vgPRDv42WLRzwTAXtt9fzby9a2ebjskx4Jbut0DraugS1ypHEq1+S89F5y919SWdXl
	 nxyzblGc7OqK92k5nLOM8JSR5ZojWwCWznvhkb4+Z03SCpIIzmKZSU0LmBpG4hQmdE
	 +C5O5seSDVrlg==
Date: Tue, 2 Sep 2025 11:26:36 +0100
From: Lee Jones <lee@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: "pavel@kernel.org" <pavel@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V8 2/2] leds: pwm: Add optional GPIO enable pin support
Message-ID: <20250902102636.GF2163762@google.com>
References: <20250724080221.7562-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20250724080221.7562-3-Qing-wu.Li@leica-geosystems.com.cn>
 <20250731104623.GD1049189@google.com>
 <PAXPR06MB7966CCA6E36625F3F807DA2BD72BA@PAXPR06MB7966.eurprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR06MB7966CCA6E36625F3F807DA2BD72BA@PAXPR06MB7966.eurprd06.prod.outlook.com>

On Tue, 12 Aug 2025, LI Qingwu wrote:

> 
> 
> > -----Original Message-----
> > From: Lee Jones <lee@kernel.org>
> > Sent: Thursday, July 31, 2025 6:46 PM
> > To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> > Cc: pavel@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> > conor+dt@kernel.org; linux-leds@vger.kernel.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH V8 2/2] leds: pwm: Add optional GPIO enable pin support
> > 
> > 
> > On Thu, 24 Jul 2025, LI Qingwu wrote:
> > 
> > > Add support for optional GPIO-based enable pin control to PWM LED driver.
> > > Some PWM LED driver chips like TPS92380 and LT3743 require a separate
> > > enable signal in addition to PWM control. Implement support for such
> > > GPIO control through the "enable-gpios" device tree property,
> > > activating the pin when LED brightness is non-zero and deactivating it when
> > off.
> > >
> > > Tested on i.MX8MP EVK with TPS92380 LED driver chip
> > >
> > > Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> > > ---
> > >  drivers/leds/leds-pwm.c | 20 ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c index
> > > c73134e7b9514..08a1f735166ad 100644
> > > --- a/drivers/leds/leds-pwm.c
> > > +++ b/drivers/leds/leds-pwm.c
> > > @@ -17,6 +17,7 @@
> > >  #include <linux/err.h>
> > >  #include <linux/pwm.h>
> > >  #include <linux/slab.h>
> > > +#include <linux/gpio/consumer.h>
> > 
> > This list is alphabetical.
> > 
> The original code's include order is not alphabetical,
> If you prefer, I can reorder all or just put "#include <linux/gpio/consumer.h>" to first line,
> Please let me know your preference.

First line is okay for now.

Then, if you feel like it, submit another patch to place them in order.

-- 
Lee Jones [李琼斯]

