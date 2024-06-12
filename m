Return-Path: <linux-leds+bounces-1885-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E7B9056D0
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 17:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2A791F220E8
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 15:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D5317E442;
	Wed, 12 Jun 2024 15:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EIo4ptv5"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2C517C7C8;
	Wed, 12 Jun 2024 15:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718206002; cv=none; b=VIFWpT3jUdLzs2QdsiRYhLREPpNxAiS80+2/itg8eEacq2twQambVNaxJijuHROvGT082rXFMFSg3GTytlBSct4Mbdc+Y/cQrHm6LogggGCO+eGACKqpPq/nROMO3007S4HXqYsUiFHfGdhfuMg/shrlXlUaCSN6PKclcicHCPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718206002; c=relaxed/simple;
	bh=lSGsgkHVlDvydzN5zmo3gDhFpE+AQXBOWHpHvUU2NFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdNen0KKQStF3MkySXlOI4TaAoCodkDF5J0mJiu/NDla4UPEMc1/Sv5IOnq1mU9oIanUhXE3vvfWI3SG6vHKsPmX8m+Vb+zx+JvIn1dG1Jdng6Ig3Db7oDPGm3DujTUtmq8OztEa/T+VpW7cpr15DdFFb0gN0PegZW0n0mLFN00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EIo4ptv5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB31C116B1;
	Wed, 12 Jun 2024 15:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718206000;
	bh=lSGsgkHVlDvydzN5zmo3gDhFpE+AQXBOWHpHvUU2NFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EIo4ptv5PCHaa39dCeoK2n2xjjn7XuF3jthz/Ijz/TWAesE1iXXEFjhSTBpMgz5wA
	 FPApaPoxcszqm9fxVDGgfREiVVHY3YWkCB9uvkQgYbB+fN9D7HERXMm/LsoFpUrRcH
	 0IgupL6E6VtH9JXY9OcY8lRbT7rienDoxKbpWFs8sKmK2AmWPqe1a4P0bB3SNJ4O9q
	 6yvo+MQ8IDXIE5NM2ZqM50UmeCEsXO/PsRnFlc/sb5m0Q/x5Yx4BXX/1x184mGH8tp
	 1MkIhUyn4MW6Q++ZKIjpS9o0+DOoYjXABrNf45SOLjcbk9ZyEsf0e1HLmBvOaaQ0a/
	 IWOjOR0OZ5duQ==
Date: Wed, 12 Jun 2024 16:26:35 +0100
From: Lee Jones <lee@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	Pavel Machek <pavel@ucw.cz>, Jakub Kicinski <kuba@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>, linux-leds@vger.kernel.org,
	Genes Lists <lists@sapience.com>,
	Johannes =?iso-8859-1?Q?W=FCller?= <johanneswueller@gmail.com>,
	stable@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] leds: class: Revert: "If no default trigger is given,
 make hw_control trigger the default trigger"
Message-ID: <20240612152635.GF1504919@google.com>
References: <20240607101847.23037-1-hdegoede@redhat.com>
 <6ebdcaca-c95a-48bc-b1ca-51cc1d7a86a5@lunn.ch>
 <7a73693e-87b4-4161-a058-4e36f50e1376@redhat.com>
 <5e93d4ea-0247-4803-9c0e-215d009fb9d3@leemhuis.info>
 <0cdc9042-2cad-48d4-8eb6-0732cf9e7dfa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0cdc9042-2cad-48d4-8eb6-0732cf9e7dfa@redhat.com>

On Wed, 12 Jun 2024, Hans de Goede wrote:

> Hi,
> 
> On 6/12/24 4:58 PM, Linux regression tracking (Thorsten Leemhuis) wrote:
> > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> > for once, to make this easily accessible to everyone.
> > 
> > Hans, from your point of view, how fast should we try to mainline this
> > revert? I got the impression that you want it merged there rather sooner
> > than later -- and that sounds appropriate to me.
> 
> There are at least 2 separate bug reports from 6.9 users who are gettinhg
> stuck tasks which should be fixed by this, so yes this should go upstream
> soon.
> 
> > So should we maybe ask
> > Linus on Friday to pick this up from here? Ideally of course with an ACK
> > from Pavel or Lee.
> 
> Indeed having an ack from Lee or Pavel here would be great!

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]

