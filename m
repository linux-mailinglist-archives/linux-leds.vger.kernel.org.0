Return-Path: <linux-leds+bounces-5803-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 61822BE543F
	for <lists+linux-leds@lfdr.de>; Thu, 16 Oct 2025 21:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 052154E4188
	for <lists+linux-leds@lfdr.de>; Thu, 16 Oct 2025 19:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E1F2DC35C;
	Thu, 16 Oct 2025 19:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="SXcSD+vC"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FDE2253EC;
	Thu, 16 Oct 2025 19:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760643852; cv=none; b=jqexx86wWYbr7THjN4qOBqMtl5lBNjuAOWBgTp1zGr0YHd2rpcKfzcjX85fqiqGRmvR527ZRFxBs8QBB6HQU/DMhn2jpjYV3Cf4VrYhB0GXxz40LS3mlRlcBdvjLIbU0fNacc+/YTCf5hYKl8LrlIEjYw2vGPzMcsZxWg3GNO+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760643852; c=relaxed/simple;
	bh=fpfMIqGiN+5JaFXAfQM+JL8gqh0Cq7TCWKFJRan0cC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZSWrPATUXWMZs06q09eVWn+PfWeNXXknEW6vxwq7dysYBsCgcT+BbV95E/cC2oWAX93icvIGitIj111X8ld6jdXTDzRGJuYmezqB2WnnvXYIxSR2buwIPgSwso744Wa/hwTZdYKbwa16yFUEz0I41bE3mIepdz8xUyZSldQGh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=SXcSD+vC; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=I/FPmxwkdQsHDYC9iULzo+LvmJj79arCdwTsaLGZGtw=; b=SXcSD+vCUVLqnuB90leEpBu3v0
	FeKvaRsdXh/de4GkCL/rvEbJfyYAikN0FwYaWbHBDKX7RF3vy7H05IWIAWUc+92aCV7eXtatmoe9q
	ePV/z4gzPgqR3fE2SCQPRH0mlQRTGsLhOJL1e4Z/bhmeJ1DUR2hI5lXFqTvTNmYTOLgk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v9TtP-00BCVS-3R; Thu, 16 Oct 2025 21:44:07 +0200
Date: Thu, 16 Oct 2025 21:44:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH leds v2 00/10] Add support for offloading netdev trigger
 to HW + example implementation for Turris Omnia
Message-ID: <bd95b778-a062-47b1-a386-e4561ef0c8cd@lunn.ch>
References: <20210601005155.27997-1-kabel@kernel.org>
 <CA+V-a8tW9tWw=-fFHXSvYPeipd8+ADUuQj7DGuKP-xwDrdAbyQ@mail.gmail.com>
 <7d510f5f-959c-49b7-afca-c02009898ef2@lunn.ch>
 <CA+V-a8ve0eKmBWuxGgVd_8uzy0mkBm=qDq2U8V7DpXhvHTFFww@mail.gmail.com>
 <87875554-1747-4b0e-9805-aed1a4c69a82@lunn.ch>
 <CA+V-a8vv=5yRDD-fRMohTiJ=8j-1Nq-Q7iU16Opoe0PywFb6Zg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8vv=5yRDD-fRMohTiJ=8j-1Nq-Q7iU16Opoe0PywFb6Zg@mail.gmail.com>

> I haven't explored the current leds code tbh. Can you please point me
> to any PHY which uses leds if any.

~/linux/drivers/net/phy$ grep .led_brightness_set *
air_en8811h.c:static int air_led_brightness_set(struct phy_device *phydev, u8 index,
air_en8811h.c:	.led_brightness_set	= air_led_brightness_set,
as21xxx.c:static int as21xxx_led_brightness_set(struct phy_device *phydev,
as21xxx.c:		.led_brightness_set = as21xxx_led_brightness_set,
as21xxx.c:		.led_brightness_set = as21xxx_led_brightness_set,
as21xxx.c:		.led_brightness_set = as21xxx_led_brightness_set,
as21xxx.c:		.led_brightness_set = as21xxx_led_brightness_set,
as21xxx.c:		.led_brightness_set = as21xxx_led_brightness_set,
as21xxx.c:		.led_brightness_set = as21xxx_led_brightness_set,
as21xxx.c:		.led_brightness_set = as21xxx_led_brightness_set,
as21xxx.c:		.led_brightness_set = as21xxx_led_brightness_set,
as21xxx.c:		.led_brightness_set = as21xxx_led_brightness_set,
as21xxx.c:		.led_brightness_set = as21xxx_led_brightness_set,
bcm-phy-lib.c:int bcm_phy_led_brightness_set(struct phy_device *phydev,
bcm-phy-lib.c:EXPORT_SYMBOL_GPL(bcm_phy_led_brightness_set);
bcm-phy-lib.h:int bcm_phy_led_brightness_set(struct phy_device *phydev,
broadcom.c:	.led_brightness_set	= bcm_phy_led_brightness_set,
broadcom.c:	.led_brightness_set	= bcm_phy_led_brightness_set,
broadcom.c:	.led_brightness_set	= bcm_phy_led_brightness_set,
broadcom.c:	.led_brightness_set	= bcm_phy_led_brightness_set,
broadcom.c:	.led_brightness_set	= bcm_phy_led_brightness_set,
broadcom.c:	.led_brightness_set	= bcm_phy_led_brightness_set,
broadcom.c:	.led_brightness_set	= bcm_phy_led_brightness_set,
broadcom.c:	.led_brightness_set	= bcm_phy_led_brightness_set,
broadcom.c:	.led_brightness_set	= bcm_phy_led_brightness_set,
broadcom.c:	.led_brightness_set	= bcm_phy_led_brightness_set,
broadcom.c:	.led_brightness_set	= bcm_phy_led_brightness_set,
broadcom.c:	.led_brightness_set	= bcm_phy_led_brightness_set,
broadcom.c:	.led_brightness_set	= bcm_phy_led_brightness_set,
broadcom.c:	.led_brightness_set	= bcm_phy_led_brightness_set,
broadcom.c:	.led_brightness_set	= bcm_phy_led_brightness_set,
dp83867.c:dp83867_led_brightness_set(struct phy_device *phydev,
dp83867.c:		.led_brightness_set = dp83867_led_brightness_set,
dp83td510.c:static int dp83td510_led_brightness_set(struct phy_device *phydev, u8 index,
dp83td510.c:	.led_brightness_set = dp83td510_led_brightness_set,
intel-xway.c:static int xway_gphy_led_brightness_set(struct phy_device *phydev,
intel-xway.c:		.led_brightness_set = xway_gphy_led_brightness_set,
intel-xway.c:		.led_brightness_set = xway_gphy_led_brightness_set,
intel-xway.c:		.led_brightness_set = xway_gphy_led_brightness_set,
intel-xway.c:		.led_brightness_set = xway_gphy_led_brightness_set,
intel-xway.c:		.led_brightness_set = xway_gphy_led_brightness_set,
intel-xway.c:		.led_brightness_set = xway_gphy_led_brightness_set,
intel-xway.c:		.led_brightness_set = xway_gphy_led_brightness_set,
intel-xway.c:		.led_brightness_set = xway_gphy_led_brightness_set,
intel-xway.c:		.led_brightness_set = xway_gphy_led_brightness_set,
intel-xway.c:		.led_brightness_set = xway_gphy_led_brightness_set,
marvell.c:static int m88e1318_led_brightness_set(struct phy_device *phydev,
marvell.c:		.led_brightness_set = m88e1318_led_brightness_set,
marvell.c:		.led_brightness_set = m88e1318_led_brightness_set,
marvell.c:		.led_brightness_set = m88e1318_led_brightness_set,
marvell.c:		.led_brightness_set = m88e1318_led_brightness_set,
marvell.c:		.led_brightness_set = m88e1318_led_brightness_set,
mxl-86110.c:static int mxl86110_led_brightness_set(struct phy_device *phydev,
mxl-86110.c:		.led_brightness_set	= mxl86110_led_brightness_set,
mxl-86110.c:		.led_brightness_set	= mxl86110_led_brightness_set,
mxl-gpy.c:static int gpy_led_brightness_set(struct phy_device *phydev,
mxl-gpy.c:		.led_brightness_set = gpy_led_brightness_set,
mxl-gpy.c:		.led_brightness_set = gpy_led_brightness_set,
mxl-gpy.c:		.led_brightness_set = gpy_led_brightness_set,
mxl-gpy.c:		.led_brightness_set = gpy_led_brightness_set,
mxl-gpy.c:		.led_brightness_set = gpy_led_brightness_set,
mxl-gpy.c:		.led_brightness_set = gpy_led_brightness_set,
mxl-gpy.c:		.led_brightness_set = gpy_led_brightness_set,
mxl-gpy.c:		.led_brightness_set = gpy_led_brightness_set,
mxl-gpy.c:		.led_brightness_set = gpy_led_brightness_set,

	Andrew

