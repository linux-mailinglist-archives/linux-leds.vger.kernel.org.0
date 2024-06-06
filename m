Return-Path: <linux-leds+bounces-1844-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B848FE807
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 15:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84C36289473
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 13:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A155196458;
	Thu,  6 Jun 2024 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Id1O2Qkw"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB21195F10;
	Thu,  6 Jun 2024 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717681144; cv=none; b=Wu4HSIaGsH66CSXksDEbXv85+srBwr+baxvftE3F0EsHFwUlnnOwRPo09DI8AGMX2VT8hRh/Sg2k+P9p9aGXVHIraDr18VFpyDJcFPiSptIeKg2orcP8zJMEASz2wO3ij8gymaenSxOcfextMguMPx44kkI0UI4NmUmEmlBp/x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717681144; c=relaxed/simple;
	bh=LJhHXwTof2ke/pYNJdYJXiWvVv487KuphHbWVEYAKLU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qE0qGPIAXsulob+p4xsLukkZffdwbGbb6xbNNI9sa03lhllKyVVssMbqymowbK6LwuKjuKtQN6O0sgfxH9x5ddAgcJdcaF6vIDCkM430bdb2APE/ZsLiw/0mJaBHOiXxTycwrsWGOxjyK7krnMj/DeEJLbd9f1qmcWVUiFJ4E4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Id1O2Qkw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3DBC2BD10;
	Thu,  6 Jun 2024 13:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717681144;
	bh=LJhHXwTof2ke/pYNJdYJXiWvVv487KuphHbWVEYAKLU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Id1O2QkwmmLjokKffra2g3lVZqwo7wNsk0ZGfRDUMi+AOn1QwgWbq4u8TqlsO0D6/
	 LvU6eKHd5dIftwQKWaqiaqIQmN61Is9rXL/PaM9iNPBUEBqaQ8JIKi5124xDgdy/IN
	 Ml5mWx8MCmXEhC4RCfj9iQ57ZTi5n61xhvVZEbiTj8ey814muHzi/uq2xwHp2pZYGN
	 vybkA8tKQeK4nYuic46rQjyJBFdHbENdWP+APegPEbDT8aexZd0MB1V1mw/CZy3AXF
	 c+q4QdpdzHgvI4VgmiBg3BkCXawV4i4iOZEMIICqiyoU05wPX4t0iBu6ItGGuLFmoj
	 PJzROU1Qy2v1g==
Date: Thu, 6 Jun 2024 06:39:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, Hans de Goede <hdegoede@redhat.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Pavel
 Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Linux LEDs
 <linux-leds@vger.kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, johanneswueller@gmail.com, "Russell
 King (Oracle)" <linux@armlinux.org.uk>, Genes Lists <lists@sapience.com>
Subject: Re: Hung tasks due to a AB-BA deadlock between the leds_list_lock
 rwsem and the rtnl mutex
Message-ID: <20240606063902.776794d4@kernel.org>
In-Reply-To: <c912d1f7-7039-4f55-91ac-028a906c1387@lunn.ch>
References: <9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com>
	<15a0bbd24cd01bd0b60b7047958a2e3ab556ea6f.camel@sapience.com>
	<ZliHhebSGQYZ/0S0@shell.armlinux.org.uk>
	<42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info>
	<618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>
	<01fc2e30-eafe-495c-a62d-402903fd3e2a@lunn.ch>
	<9d821cea-507f-4674-809c-a4640119c435@redhat.com>
	<c912d1f7-7039-4f55-91ac-028a906c1387@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 6 Jun 2024 15:12:54 +0200 Andrew Lunn wrote:
> > So it has been almost a week and no reply from Heiner. Since this is
> > causing real issues for users out there I think a revert of 66601a29bb23
> > should be submitted to Linus and then backported to the stable kernels.
> > to fix the immediate issue at hand.  
> 
> Agreed.

Please submit..

