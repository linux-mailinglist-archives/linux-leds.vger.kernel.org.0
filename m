Return-Path: <linux-leds+bounces-1281-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE6F886055
	for <lists+linux-leds@lfdr.de>; Thu, 21 Mar 2024 19:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9917D287955
	for <lists+linux-leds@lfdr.de>; Thu, 21 Mar 2024 18:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647701332AD;
	Thu, 21 Mar 2024 18:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NoBJdGAd"
X-Original-To: linux-leds@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711771755F;
	Thu, 21 Mar 2024 18:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711044582; cv=none; b=ojKGgU3PjIVnVhmA25br9p2/Rb1byBqbKNpELxyVfS8NqAz+w5iVgNh9hsq2mr2OD81qZY7gxM5b/3LUItwGEISWyL7UTE43sPnn40kGpQoLKVRcYpNVRYO7S66iBnwcT/NXGPAWO30/bqEY/dTvdnC/3GzlnPtdbMiNqy1Sz74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711044582; c=relaxed/simple;
	bh=EKM1WN0aZAdKU+UAA8PVXOIGWKPiZ4kqUbOcK+NoD3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bP2si+XKyQP0hr1TCWvupaHQXt2ByDiUyTsiSJrhgK53Fg2pn7lrao8rOeVGB13LnIF/jL+mL6PLUG3ciUAy3aO7aljj+lDXg24gS0bHteanEHA/BU41WOd8yMFcgiXUSE17/NOmTBAV2OIOkzbc80qeOXUawa2GHNLQrnZZ99A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NoBJdGAd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A546672;
	Thu, 21 Mar 2024 19:09:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711044550;
	bh=EKM1WN0aZAdKU+UAA8PVXOIGWKPiZ4kqUbOcK+NoD3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NoBJdGAdRAf0jKdD7YHe20YwUXAg7soWErsBSMe0L64O7Baz7SL30bkA16m/Tm+ne
	 WdTb6NCMX90Sgie175OKRQgen4cVVlan6SirqCplk2YqwAiusoALwE+rsI120k5xJU
	 vSyET+XULDUcD7XuwQ75vCGUWMNrYu3L6G5UyxQY=
Date: Thu, 21 Mar 2024 20:09:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anders Darander <anders@chargestorm.se>,
	Matt Ranostay <mranostay@gmail.com>,
	Peter Meerwald <pmeerw@pmeerw.net>,
	Ricardo Ribalda <ribalda@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: leds: pca963x: Convert text
 bindings to YAML
Message-ID: <20240321180935.GF18799@pendragon.ideasonboard.com>
References: <20240305004501.849-1-laurent.pinchart@ideasonboard.com>
 <171103315829.46862.417559829428388360.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171103315829.46862.417559829428388360.b4-ty@kernel.org>

Hi Lee,

On Thu, Mar 21, 2024 at 02:59:18PM +0000, Lee Jones wrote:
> On Tue, 05 Mar 2024 02:45:01 +0200, Laurent Pinchart wrote:
> > Convert the pca963x DT bindings to YAML schema. The existing properties
> > are kept without modification, but the example is adapted to the latest
> > common bindings for LEDs.
> 
> Applied, thanks!
> 
> [1/1] dt-bindings: leds: pca963x: Convert text bindings to YAML
>       commit: 779027a0a7392610cbfd3210836d6b0e6ddef434

Thank you. https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/
doesn't contain that commit, have you just not pushed yet, or am I
looking at the wrong tree ?

-- 
Regards,

Laurent Pinchart

