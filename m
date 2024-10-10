Return-Path: <linux-leds+bounces-3056-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C98F6998F14
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 19:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A7501F236A7
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 17:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC6C19D078;
	Thu, 10 Oct 2024 17:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QT7Az7YG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C7119CD1D;
	Thu, 10 Oct 2024 17:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728583144; cv=none; b=GjRmW/7Bl2RS94VGBwpUEeFroWThVbTP4jk6GILPiVsqJAnF2nYv/UqnftzErofVVdJhql/uyBFOcd3zGdmX3hkOo1QFneZYPgXLZicDrY0JNXr6sT0n7avAlVbMp4FLV5EWZiBXH01a9e2zI2VskGClpBiYdkibjJXbfwyPSEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728583144; c=relaxed/simple;
	bh=IoPFD/Iol5uq0QVp0o5+LXdn1au6mAzdyW+O+wK5Q/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsy6v2v1AUlWBKtBrVCXwbpm6/ywH9r2ohI8USIpWDCVwdtGUabU0rE6VPepywnpOC4HNIXXvUUr1NcItmQJ5RTCGCK13i5KHrea3XqAsXRiR3v8Fu4iCNtk8hQYjkTwFZ/JbFtIjv2IGS3pjvs2bnNo27kOJsyM1vl58jJjEP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QT7Az7YG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3D4C4CEC5;
	Thu, 10 Oct 2024 17:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728583144;
	bh=IoPFD/Iol5uq0QVp0o5+LXdn1au6mAzdyW+O+wK5Q/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QT7Az7YG21Hb6yHNqJTBXdEwXreXSc+l2R2dswsJBciKQ1Ts7c69FUDQi527ML20O
	 ScyZ/jrUjEmvY4AWaXPHuafK2QfQsFznXmxqIDeFbF48+t5itGC8SdrFLXR+lsrtB2
	 TT4tXZlKoG5rQKjX/q+tbKSkt0A7HBT36zRDxWbOvbvAT+lHckDfNsXh6eSEFJrCl5
	 gtdpdR+RIFEahaEFMGGKpHi40gQGB/o0FC895D0oVnfQwae4TEos02Q+aFpzHWSprW
	 thEFs+OXGXkBLJuOmVJAj0ka87f8XUfhyWt0x38gUa3wtfRWeJeo4o1SlKPIla2mvO
	 HU6YVfEBw4+1Q==
Date: Thu, 10 Oct 2024 12:58:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: William Zhang <william.zhang@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Pavel Machek <pavel@ucw.cz>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	devicetree@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Anand Gore <anand.gore@broadcom.com>, Lee Jones <lee@kernel.org>,
	Kursad Oney <kursad.oney@broadcom.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: leds: bcm63138: Add shift register
 bits
Message-ID: <172858313648.2092159.8740994933271574101.robh@kernel.org>
References: <20241010-bcm63138-leds-v4-0-cdb80780a555@linaro.org>
 <20241010-bcm63138-leds-v4-1-cdb80780a555@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-bcm63138-leds-v4-1-cdb80780a555@linaro.org>


On Thu, 10 Oct 2024 16:10:50 +0200, Linus Walleij wrote:
> The BCM63138 family of serial LED controllers has a register
> where we can set up bits for the shift registers. These are
> the number of rounds the bits need to be shifted before all
> bits have been shifted through the external shift registers.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Mention that HW defaults will be used if the shift
>   register property is missing.
> ChangeLog v1->v2:
> - Drop the $ref to u32 since the new property is suffixed
>   with "-bits" and thus get standard treatment.
> ---
>  Documentation/devicetree/bindings/leds/leds-bcm63138.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


