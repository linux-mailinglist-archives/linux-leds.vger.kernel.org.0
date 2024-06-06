Return-Path: <linux-leds+bounces-1843-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C40D8FE753
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 15:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CA1E286A5C
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 13:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00538196457;
	Thu,  6 Jun 2024 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="psNM1Sxe"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C07113E048;
	Thu,  6 Jun 2024 13:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679578; cv=none; b=so/mbFYHlp9Yk+ZtfAE0Gkyrbsqipm9Ad73iz+/ILPNJpIkCOr+ByDa6pBcNO4Tq0tTgHmKQrfBgEzoisvmh2Jrq5g4u05nZVZZVFaYqkWNJbAUoCxhyGSjK0dfK6Da/+0eGEm5gq/B+kdqxD12GHGzg8VZcSHMtTnzK1Rjmmgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679578; c=relaxed/simple;
	bh=/lZ2BYcrM4C1FTva85h800BNm7AqRYMNH48jl1SeFGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNkYQgLs9FI5I8FqUJKAwWDEYMEP+pvunKAoBv8aISikf3z/sp9XGaVBoJtQOPS9qBx498FVqsBu44cmO9Sef+HxGR0d3BmDrXF9tzAxXeR8UAIH/BKhayQidiyK9UE9tmUH/K/9SqJDWKuJ5HTFNJiy4Dyxek6JS1n+Mo1Ntz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=psNM1Sxe; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AabFQf2K5U/YXOtE0/+9Nd1MxGeeSYhbeG/HuHMqqT8=; b=psNM1SxeheomvzkqAADibR9/Qr
	U7QOw/EBxs0n9Z/yKwryqpgkoUz93ilwBZI3e48S/GVNhSHF3ilJe0q8DMIGA1z+zB/gRXv2LMLC8
	EsmHINuKmeWo7XXt4AVRRJ6VOH/6UtEYZftDXUxWBcjFve7Pk2Y8MxMYNteMjolvpIkY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sFCvG-00H1AS-Ff; Thu, 06 Jun 2024 15:12:54 +0200
Date: Thu, 6 Jun 2024 15:12:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Linux LEDs <linux-leds@vger.kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, johanneswueller@gmail.com,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	Genes Lists <lists@sapience.com>
Subject: Re: Hung tasks due to a AB-BA deadlock between the leds_list_lock
 rwsem and the rtnl mutex
Message-ID: <c912d1f7-7039-4f55-91ac-028a906c1387@lunn.ch>
References: <9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com>
 <15a0bbd24cd01bd0b60b7047958a2e3ab556ea6f.camel@sapience.com>
 <ZliHhebSGQYZ/0S0@shell.armlinux.org.uk>
 <42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info>
 <618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>
 <01fc2e30-eafe-495c-a62d-402903fd3e2a@lunn.ch>
 <9d821cea-507f-4674-809c-a4640119c435@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d821cea-507f-4674-809c-a4640119c435@redhat.com>

> So it has been almost a week and no reply from Heiner. Since this is
> causing real issues for users out there I think a revert of 66601a29bb23
> should be submitted to Linus and then backported to the stable kernels.
> to fix the immediate issue at hand.

Agreed.

	Andrew

