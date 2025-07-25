Return-Path: <linux-leds+bounces-5139-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E8CB124E9
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 21:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C5C71CE1A25
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 19:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A5824DD00;
	Fri, 25 Jul 2025 19:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7IReT1m"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9A81E766F;
	Fri, 25 Jul 2025 19:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753473104; cv=none; b=rhXRLgU1hERyQM+Au7a/WJIduCNrpgaIKqcobltYix3BzPSetSheJTw+8sobLEqOZZKhfNmpMgwaBwsUKoeRrC8zjtNazv+/o23qKyIRYRyeKCkIgk3JHzwSGskpuZ6T3k+NDelUIuL1VkJACAN+Oj4oIwZEVMHhD87uhRutdhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753473104; c=relaxed/simple;
	bh=HIFZCasQnvflawLHEinivIZ7CGoYHgz1TfOYSlsci5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldnfDQEBz/AiF0lbR9kIaBmUyPtzyt+w5M/1V6uC02F0d0W+/xr09lbFwoyEfnemFOtYXPFdZMVR+vU2ESGF7sa1RhunO+8oHXNt9gUkOd0bpXowjpUQGzk+YitlIgEXp1V6X4+EHly7lR0BIp8+WOvjJFiUAb1L6hw4XoANDFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7IReT1m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08BEC4CEE7;
	Fri, 25 Jul 2025 19:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753473103;
	bh=HIFZCasQnvflawLHEinivIZ7CGoYHgz1TfOYSlsci5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7IReT1m8egDm2RiZG6IZs9XJkWSVWWEaWM2T9QRwgauUdX2AFDzeVRji+7xYvf7w
	 2q5Iq3z3/d+RbsVRQ2TymUaZsf7afz1W1pHCg6neFeqOeAH092Rfhqb0RwuYUv7/pA
	 2sUaBr7obPmpG9Dd+eD7eFRQnZXyNO/znE8rgPc/yqfp/pRLxTXZbhso5dJxsmagpv
	 TEojpnKd1CEmpaXLYT1n7FyiMD7faZq0Mif46V7ZOTZe5uPTjHDb2XJEnNM0sbPn1w
	 2KIQ1Ox/iZbrveQ7eeXIjyiu0LwcAfEAOsUWt8NOXvbsJPC5FW7GzEYVn6MTJJP2R/
	 lSDhPTaQdiSJQ==
Date: Fri, 25 Jul 2025 14:51:43 -0500
From: Rob Herring <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Thompson <danielt@kernel.org>, Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: backlight: Add max25014 bindings
Message-ID: <20250725195143.GA1735522-robh@kernel.org>
References: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
 <20250725-max25014-v1-1-0e8cce92078e@gocontroll.com>
 <175345006903.1002291.4212198267952446360.robh@kernel.org>
 <03096180-1e33-4dd0-b027-cc18a5010e46@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03096180-1e33-4dd0-b027-cc18a5010e46@gocontroll.com>

On Fri, Jul 25, 2025 at 04:06:45PM +0200, Maud Spierings wrote:
> 
> 
> On 7/25/25 15:27, Rob Herring (Arm) wrote:
> > 
> > On Fri, 25 Jul 2025 13:09:23 +0200, Maud Spierings wrote:
> > > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > > with intgrated boost controller.
> > > 
> > > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> > > ---
> > >   .../bindings/leds/backlight/maxim,max25014.yaml    | 78 ++++++++++++++++++++++
> > >   MAINTAINERS                                        |  5 ++
> > >   2 files changed, 83 insertions(+)
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> 
> Pretty sure I did that, but I've never gotten those tools to work quite
> right, I'll look at it for v2

What's the issue?

Rob

