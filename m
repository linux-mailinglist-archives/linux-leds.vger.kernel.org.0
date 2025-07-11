Return-Path: <linux-leds+bounces-5040-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D44B020D4
	for <lists+linux-leds@lfdr.de>; Fri, 11 Jul 2025 17:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2001E76783D
	for <lists+linux-leds@lfdr.de>; Fri, 11 Jul 2025 15:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E101C2ED157;
	Fri, 11 Jul 2025 15:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="EotjUhZF"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515DF2AE6D;
	Fri, 11 Jul 2025 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752248927; cv=none; b=hn/9SkgUItskE96YEZeW0iVC3CAjTCKuchxrNV8zvAC0N6ymon9annon4dHTuXBRolbim0UMmJtpQ7o48qCp2ZK2lBxHzNv1EEZVNNPBfHvEkMMHd2Ji3sDq8EHXwhESRwFOu62IJ0hY1D31yCWGPttYf4tE/N7YPywzquST17c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752248927; c=relaxed/simple;
	bh=iC/lTa9y4hlsRpGD7UKEiTf0o/RlEJlF7tlPi5jNFlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mz7JBMgvyZpIU1jJuqzMoawoYY0cfwLwwneALNcBTIqZhh5oe2lNF2ZYbNy0EPLggkPC909U3lcnliObPsrStgmWbfKHOKAtUny+voyoxVwBtwSOeW88VezKOHaffSaDefxLZWy8abBPtBEVhHReiUNygKPkOA+JCmgz8n8nHAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=EotjUhZF; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=K1Qv6uL2mr9yRM61qozPLoLnLb41zm/L4dsWSYDNTh4=; b=EotjUhZFiQqHqAqg+4yiKECfce
	J7dLy54bFH/y11MoA6y/EweKIRh7PxYo6G+tCEt9UjB0092OhPolRiu81ox7WIQ3ckt6FtAM0wUg7
	Bh+rk9ygUZd+EIKk19t5ygF7OvMOBIH+wqCTBfL4qCl1AMtK52lMynM4ZnWZPM6y0dJs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uaFzL-001FOZ-62; Fri, 11 Jul 2025 17:48:39 +0200
Date: Fri, 11 Jul 2025 17:48:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Marek Vasut <marex@denx.de>, Lukasz Majewski <lukma@denx.de>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] Revert "leds: trigger: netdev: Configure LED blink
 interval for HW offload"
Message-ID: <aa3aa13d-f04b-4251-ac85-ba3e6828b1ce@lunn.ch>
References: <c28c2a71489b34fe595d694c809f553978069653.1752248354.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c28c2a71489b34fe595d694c809f553978069653.1752248354.git.daniel@makrotopia.org>

On Fri, Jul 11, 2025 at 04:40:29PM +0100, Daniel Golle wrote:
> This reverts commit c629c972b310af41e9e072febb6dae9a299edde6.

I can see that from reading the patch. What is missing from the commit
message is the answer to the question: Why?

Please include a short description of the regression this caused, and
link to the discussion.

    Andrew

---
pw-bot: cr

