Return-Path: <linux-leds+bounces-3831-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 639C4A171FB
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 18:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EEF8160286
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 17:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD2B17A5A4;
	Mon, 20 Jan 2025 17:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PiVte+wY"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5602115381A;
	Mon, 20 Jan 2025 17:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737394486; cv=none; b=egWfgBT5Wh05+bWRMOHZLmtmpBzUYDjDEB8/Dmtfk7O56D2OvhSVGMcKLcJd/HmWqa9LkLdnSsbHhfoSFEd4nKmKRKwsedWTTPUtOs0uwVEl3ZpPAprmMlurB9+7K0r3cS4Snc/99TFfcgVVPn8aCjxobXrE/8KRMoix4MxGJYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737394486; c=relaxed/simple;
	bh=0gqkl+E1P9Uk9N5su1IB8MPHCCtQk14/H/NOn2rx7Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hhT0DgLnHrnUgLAPT+HkiKsb7XK8xZ4Wqd7fpF01b5SiZ1uihApFVL1A+8FLQAwwjngrw8rQAXgIXenQ08q2zhBph6mK54zS42WHt5k0jOmkkZj6RAxV40D+FXZcnaHUPWNnlHCU86SNSYq+eEvixchOktBN1yz78Z9pULGmKE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PiVte+wY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F74EC4CEDD;
	Mon, 20 Jan 2025 17:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737394485;
	bh=0gqkl+E1P9Uk9N5su1IB8MPHCCtQk14/H/NOn2rx7Ns=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PiVte+wYOmmi9LS4l02xNbHwRS2gO4Oz7D5evFbVEZ94sJIavhClxJ2a8D0HXDkAn
	 iVgBZwwUt1ROEG2XHB9Ao89AlAD0scbCK8NfRZnR5hDTcJXAFnkNKhJIMosNNK6Arz
	 SQtE0htcbNV5Gyku/5bYcDBdT9wg+J1575lNTLlTGCIlcYR6cFYmPA5Ocm+vdmBhMN
	 WxopM4k4Xps7eoBZ3MdcwSsLgTVIkyBTFU41sLl+jAOv2rbx/I/LFJ8Em2sgNXngiX
	 uJ8fwnnOcSJ7QF/9OaNbYpxitvRWXoSBN5NLhqfsRrzOr56rdmUYwfAt2lZ+60ZoDJ
	 +/vbyW79YUOtQ==
Date: Mon, 20 Jan 2025 09:34:44 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-leds@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Russell
 King <linux@armlinux.org.uk>, netdev@vger.kernel.org
Subject: Re: [PATCH] net: phy: Handle both led@0 and led subnode name for
 single-LED PHYs
Message-ID: <20250120093444.683501ad@kernel.org>
In-Reply-To: <197f3134-96fa-484f-a5f5-36779c54b340@denx.de>
References: <20250120082609.50445-1-marex@denx.de>
	<197f3134-96fa-484f-a5f5-36779c54b340@denx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Jan 2025 10:02:33 +0100 Marek Vasut wrote:
> > Handle this special case. In case reg property is not present in the leds
> > node subnode, test whether the leds node contains exactly one subnode, and
> > if so, assume this is the one single LED with reg property set to 0.
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>  
> Please ignore, V2 is coming with a trivial fix for variable rename.

We have a rule prohibiting reports within 24h. See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#resending-after-review
One of the goals is to make sure people build test their patches.
Please follow the guidelines.
-- 
pv-bot: 24h

