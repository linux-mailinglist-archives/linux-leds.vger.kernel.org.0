Return-Path: <linux-leds+bounces-6516-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D3FCEE22A
	for <lists+linux-leds@lfdr.de>; Fri, 02 Jan 2026 11:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9AF263007DBD
	for <lists+linux-leds@lfdr.de>; Fri,  2 Jan 2026 10:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DE52D6630;
	Fri,  2 Jan 2026 10:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjDIlY/U"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9131D5CF2;
	Fri,  2 Jan 2026 10:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767348741; cv=none; b=A0hRHeTAqrjDn8oygXCQo8b87m3ZPf8RPbaCZxjOpwWkNLNZY+ivQk+uoT6xJ/ApHpPMGFNSlizpFHpERqlnKOJLA8NxC7rtMB5rrndqaTykjptL90ouzOslCHMmrSevKmzCizmb8q31WVqzr7HBUnvto9L8TOO9J4xQlBGYisw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767348741; c=relaxed/simple;
	bh=Mgi19FktTJfeS5uYQiWp51lQWf5TpJdFtlT48hMXADw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYaSB9eHy73zNfIxmoCa6jBUBo35i7BDa9JCCfgJ7g2Zc1b5wdefmjEuTZO4+O4dMksbqunbiLofJ16tKwzYnPyxyMST9rIJaLiBPFGp0NNUnmu62W/s0lQvwaT6mRLUTAfNYLb/0lJmSKZ1+OG7V3Y2zQdFB8qoO7hqf76UbG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjDIlY/U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5A7C116B1;
	Fri,  2 Jan 2026 10:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767348740;
	bh=Mgi19FktTJfeS5uYQiWp51lQWf5TpJdFtlT48hMXADw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjDIlY/UH9LNCxLMapbBkZxRLgWlrUrkfesfBt59dI8faRsoD7yLAq8eh454ZKh/U
	 R3JS63/KRbTfvZPkbUv9PpGAJHpQ+FDSRbRsipBF/uOI1oiZco55mwc5Gk2LKkTMOP
	 30s4qQ6/vAuLTOQ/jwaE2SpydwvkhvG4HlDvI9vedgcAyvdUSzUhcIHabbp1sVvxcd
	 RqoXpb5s707/B79Q0GfiS8JSTk0jFM1aBzWWpp9ggoyiy8p8c0SoriBGf33P5okuas
	 B9bILU078w71iKi1grsXLvcuPWYkZkczWCgJI4jKiSQSdER421q1119MnNlNJCBAcC
	 1Wa8y+a8bTl2Q==
Date: Fri, 2 Jan 2026 11:12:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Brophy <professorjonny98@gmail.com>
Cc: lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Andriy Shevencho <andriy.shevchenko@linux.intel.com>, Jonathan Brophy <professor_jonny@hotmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Radoslav Tsvetkov <rtsvetkov@gradotech.eu>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] dt-bindings: leds: common: Add led-instance
 property
Message-ID: <20260102-belligerent-rich-ape-b8dfd2@quoll>
References: <20251228182252.1550173-1-professorjonny98@gmail.com>
 <20251228182252.1550173-3-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251228182252.1550173-3-professorjonny98@gmail.com>

On Mon, Dec 29, 2025 at 07:22:45AM +1300, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> Document the optional "led-instance" property for providing deterministic
> LED naming when multiple LEDs share the same function and color.

Label already provides that name.

Best regards,
Krzysztof


