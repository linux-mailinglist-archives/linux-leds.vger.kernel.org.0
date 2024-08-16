Return-Path: <linux-leds+bounces-2463-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B70AE954E20
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 17:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8F2B1C208E4
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 15:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683BE1BD515;
	Fri, 16 Aug 2024 15:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUE4yGhr"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8114174C;
	Fri, 16 Aug 2024 15:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723823277; cv=none; b=bFA1JF7gcO3Qjn/2P3h2uR0KheD4mBLQ2kRG9QUZKaTrg2A/uVrpoIXZ9WIV853gnfUUwy2wnqtnfP/qhNzyCEtdhqLWbTrWKnUFAOPgPWsf5eEbUERBEy3H2Ai74D7P6B+txWoaRq1RSTXCJINFwQTIL8MTQ1uTN0vgCTA7+xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723823277; c=relaxed/simple;
	bh=cjjQbNSGoF8tYAlgI8RRRPY7ZAEFjQE8hO6yKKBy4LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8Mj85af45h1tWNoarsu/Q0K+n2v9EeF/K1nZwhd6NF76QoiKHs7utcV9tB/24QCFuXb6ez6cW+I8psYYlNiEsdQj2HgiV0pvuN437QuLBEK//fACadUf9c+kGwbzs2spg8/fiukXLVp3XpEuU65s8D26WyBh49P8yRpdxXWsNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUE4yGhr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A1DC4AF0B;
	Fri, 16 Aug 2024 15:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723823277;
	bh=cjjQbNSGoF8tYAlgI8RRRPY7ZAEFjQE8hO6yKKBy4LE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUE4yGhr6y+SLAvslevG6KUs4g5ltrPp9Xt8MybU//UGN3BXnpQgSJG/D05GBNkHa
	 vbxubSO3cOUUaAr32eP/wiNCtNZMoFBahqhs7lewhWboc9yS40KPbG6a5h3cpPC7iD
	 WbE6JL1lUcA/M8/gNK+7iMoDp/s9nwKv3PvKczBZNAD4nykHMJiZJJmAFEYBKkaVTs
	 1yaKz8lKvcWjcZT34nV14+utfYMS7In0/hSFj4R1Zny7XyBiJLtadJqEXcoCIyWsIH
	 F/XkUehZd5ylC1aDXgkK+v9q83yeLULOd4pWZIKILvdx1Pe6q2oFUf2IvYNHfloAF6
	 jdQnrw3RL5HTA==
Date: Fri, 16 Aug 2024 16:47:30 +0100
From: Lee Jones <lee@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: Document "netdev" trigger
Message-ID: <20240816154626.GC5853@google.com>
References: <20240708114653.18566-1-marex@denx.de>
 <20240725085042.GC501857@google.com>
 <3c8bf807-8a8e-4704-a90a-d77ad3293b57@lunn.ch>
 <20240801125309.GE6756@google.com>
 <62cc3d64-c5e4-4af3-90ce-273ece6e8e57@lunn.ch>
 <20240805135643.GC1019230@google.com>
 <ed20f083-90e1-406c-bcda-f9fc92807278@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed20f083-90e1-406c-bcda-f9fc92807278@lunn.ch>

On Tue, 06 Aug 2024, Andrew Lunn wrote:

> > > We could do, but we have to keep netdev around for backwards
> > > compatibility. There are DT blobs using it which we cannot break.
> > 
> > Oh, this 'just' a documentation patch?  'netdev' is already in use?
> > 
> 
> A few examples:
> 
> intel/ixp/intel-ixp42x-iomega-nas100d.dts:                      linux,default-trigger = "netdev";
> intel/ixp/intel-ixp42x-dlink-dsm-g600.dts:                      linux,default-trigger = "netdev";
> nxp/imx/imx53-m53menlo.dts:                     linux,default-trigger = "netdev";
> rockchip/rk3128-xpi-3128.dts:                    * linux,default-trigger = "netdev";
> ti/omap/am5729-beagleboneai.dts:                        linux,default-trigger = "netdev";
> ti/omap/am335x-netcan-plus-1xx.dts:                     linux,default-trigger = "netdev";

Gross!  Okay.

-- 
Lee Jones [李琼斯]

