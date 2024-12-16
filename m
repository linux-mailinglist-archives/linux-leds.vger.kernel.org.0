Return-Path: <linux-leds+bounces-3615-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C710C9F2D67
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 10:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1143B16420D
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 09:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA47201026;
	Mon, 16 Dec 2024 09:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="QGEJTBqB"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C1BBA49;
	Mon, 16 Dec 2024 09:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734342789; cv=none; b=qHVOdCYo6CY1m58FuaTEXiTTqGuAaT1wSsPy7ZfysvXKjrb7Xc1FluS9ifpnJeKr9zEN97mMycgBsGR7DCi3Cf6+HRkIQKmt1jgosU3FuBGvwv5m6tlKOBPAEN6feduZmGDav35Jnjxnohto+Q6iaKU6PsKmcfeCXOp1rNdwtH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734342789; c=relaxed/simple;
	bh=/CKUXBtOOwZ//wpp/7irongspgmXVlrvsuTwSU9fzBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksERfYmva8E9+LVHeslt+5Zg/chDGNg6MDP7y2MICfs1MFIYXBbpc0/uokvxOIgLxcQmJ2i8EunBCe8c/pjZQcqbaPMS47sj0y1Hm3oTguGWqAWk0Gy6RWQZuylo1aywnU/SuI/ktWRnV+71uuM3NOaAqsOaFtYsAEkEMPFnrxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=QGEJTBqB; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=c/jnkkvjkZkhQh2NENGcQlzKqSHY5puqA49DNvov0QU=; b=QGEJTBqB+7Od0l5rj5GQrkfojR
	1ioziAekL5aDc24THwFfE1w2fe6ZJw6GVK96MYaZ5jH/ZTpMYOpsJShzq9NtaOqSiOU51muWr555r
	4acoHFT3hqYunsPjJbl0S9S8UXSQ+yaU7/m1NHOl3Ij/W0N+KiC5UPRjANGMXuN2RiUQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tN7mQ-000ZwQ-IH; Mon, 16 Dec 2024 10:52:46 +0100
Date: Mon, 16 Dec 2024 10:52:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lee Jones <lee@kernel.org>
Cc: Marek Vasut <marex@denx.de>, linux-leds@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lukasz Majewski <lukma@denx.de>, Pavel Machek <pavel@ucw.cz>,
	kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: netdev: Check offload ability on
 interface up
Message-ID: <417d05ba-0def-45b9-a086-ea36c580c472@lunn.ch>
References: <20241001024731.140069-1-marex@denx.de>
 <6f848ef7-c921-4694-9fd5-4a777d5271d0@lunn.ch>
 <72383917-4bbe-4b95-9e2f-4e364f5288bd@denx.de>
 <5c15ea24-8ca1-4b44-b6d6-fa6adac50334@lunn.ch>
 <20241216093525.GG2418536@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216093525.GG2418536@google.com>

> It looked like the conversation was continuing.

Yes, it did, for nice to have additional functionality. But i think
the base patch is good to go, and it has my Reviewed-by:.

I expect there will be a resend coming soon :-)

	Andrew

