Return-Path: <linux-leds+bounces-1916-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63295907994
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 19:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1FC0283561
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 17:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C2D14A091;
	Thu, 13 Jun 2024 17:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPMe2W5q"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DBC12D76D;
	Thu, 13 Jun 2024 17:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718299141; cv=none; b=XoCYcwZNvLtYv3fz4QUuG0MG+pKOWMqa8fTteWShVG/F+12w5yhhibgE8J8X9TMI9mjdpsiO6FQX8IpvsKxgS97Ud04bMuXsKHqxE1P9Y+44PJiez1G8c5LPCJA6me6BA4RLpfmXZOf4jBMXmoZ4GXupJ7v90Lk98+KENdGXBj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718299141; c=relaxed/simple;
	bh=/FRqBJ2+W9oi2BU9wQ0dzEOCrTnN9o8UYQjQ6KKGegg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BraO1iE34dENe+TcYwNIZreSgStr8/GDIigQyXiz0mguWVGMBfqfYxzR/YAiPj8Pw8h/3W3fO4Ic+mq7qeBLQfWedYMBHXzpM5Nib4mYPSxwkhtuJ5wFNn1ehKsG1Eu0K6gbBxOMLDpKRIiNILomBeQKL9zRaw4Cs/wfWwFwA3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPMe2W5q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB0AC2BBFC;
	Thu, 13 Jun 2024 17:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718299140;
	bh=/FRqBJ2+W9oi2BU9wQ0dzEOCrTnN9o8UYQjQ6KKGegg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QPMe2W5qRO49VpynzkQuyjHER7fJc/OxSZSqr+1Xx9xtGDumzv7UBy9TSDnOdKKub
	 bD6ldak9xEoJTTwfRO3is+ngcveTbe2DdZy9aVkjit7bJAl3+NBuRImqcEiTan15Yd
	 /c4j47b5mVPzW33yO5C92LsJm5yr1qxX8pAuYzhR2zSVx+sBnjiPoojsjiV0uyJJMa
	 8lht12SgN+ELZgs8SWoHMuCkyVuucbl01YMwvjuAfYYK1mnfaF/wFM/PX16tayzNWK
	 MwyDu2XWxMYD8jE3545aYxKhyRtIIboV//Do5w4qXTJCLqXUCqo8+6f2gDFPrhyX83
	 SoNs6J7D7g89Q==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 stable@vger.kernel.org
In-Reply-To: <20240611-leds-mt6360-memleak-v1-1-93642eb5011e@gmail.com>
References: <20240611-leds-mt6360-memleak-v1-1-93642eb5011e@gmail.com>
Subject: Re: (subset) [PATCH] leds: mt6360: fix memory leak in
 mt6360_init_isnk_properties()
Message-Id: <171829913865.2730656.15082928550080844498.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 18:18:58 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 11 Jun 2024 00:40:26 +0200, Javier Carrasco wrote:
> The fwnode_for_each_child_node() loop requires manual intervention to
> decrement the child refcount in case of an early return.
> 
> Add the missing calls to fwnode_handle_put(child) to avoid memory leaks
> in the error paths.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: mt6360: fix memory leak in mt6360_init_isnk_properties()
      commit: 6e0b2281085191fbf34fb24ef272cb44a82de4f0

--
Lee Jones [李琼斯]


