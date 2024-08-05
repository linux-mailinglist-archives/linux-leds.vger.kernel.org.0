Return-Path: <linux-leds+bounces-2407-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1524F9485AB
	for <lists+linux-leds@lfdr.de>; Tue,  6 Aug 2024 00:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A1841C21143
	for <lists+linux-leds@lfdr.de>; Mon,  5 Aug 2024 22:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9B016B399;
	Mon,  5 Aug 2024 22:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="wj5gBcBT"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EB3149C4E;
	Mon,  5 Aug 2024 22:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722898587; cv=none; b=Ej45GPO7XrPJaI24rQ8VN9ddFksXaPpT20SJbA/YZkFh/U3qENdujollq+0sY51GWA1wDc1lpHrxAgcicA5JsmVw23eBPDsJD8Mx5fCL9b+RomidrQtD5mvDpEc8LOV2Xxv60waic6ZB2Egd7AraYRu0m8jU3o8YZtilkMAfqwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722898587; c=relaxed/simple;
	bh=IApU7eA9Vqk1pm5p0iTsDkpfr+qGAog943HK4ITXWhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8g2X02PIC8cV0bPyLAOSld4uryxwEuir5QBPsF4rTXlO6CSAK/cvKDqOVEiO6ySYdQvSaiL5LgMzXmUzVqPj9mGcGUuCYxwvLtFt0G3Yp4c2+mKWABr0bHGZQdMtAZ1g4swzTx0v6WOMeDMrqrko+ciH87H9rC8b+vguBS4Fx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=wj5gBcBT; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=T6lqsIdxJoDvvVcbuG9ghR8XSHtqSqMI0Pkde1xUmXo=; b=wj5gBcBTKh1QzAmgo/GTNMr146
	VU+Et446ApSAtEzpDk5YeTRkMPiPUfst7JxbdyrCMi1xxOePqy1r0Qbk4dz1vdBl8ZHmQNhUme9mH
	ZMkpjMUPkEnuseppgT0+n2mv83I73IWX4eBw7Ln5a6EBggNfBpuZxUa9dRJjhJ3XZjtI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sb6ck-0044Xj-M1; Tue, 06 Aug 2024 00:56:18 +0200
Date: Tue, 6 Aug 2024 00:56:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lee Jones <lee@kernel.org>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: Document "netdev" trigger
Message-ID: <ed20f083-90e1-406c-bcda-f9fc92807278@lunn.ch>
References: <20240708114653.18566-1-marex@denx.de>
 <20240725085042.GC501857@google.com>
 <3c8bf807-8a8e-4704-a90a-d77ad3293b57@lunn.ch>
 <20240801125309.GE6756@google.com>
 <62cc3d64-c5e4-4af3-90ce-273ece6e8e57@lunn.ch>
 <20240805135643.GC1019230@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805135643.GC1019230@google.com>

> > We could do, but we have to keep netdev around for backwards
> > compatibility. There are DT blobs using it which we cannot break.
> 
> Oh, this 'just' a documentation patch?  'netdev' is already in use?
> 

A few examples:

intel/ixp/intel-ixp42x-iomega-nas100d.dts:                      linux,default-trigger = "netdev";
intel/ixp/intel-ixp42x-dlink-dsm-g600.dts:                      linux,default-trigger = "netdev";
nxp/imx/imx53-m53menlo.dts:                     linux,default-trigger = "netdev";
rockchip/rk3128-xpi-3128.dts:                    * linux,default-trigger = "netdev";
ti/omap/am5729-beagleboneai.dts:                        linux,default-trigger = "netdev";
ti/omap/am335x-netcan-plus-1xx.dts:                     linux,default-trigger = "netdev";

	Andrew

