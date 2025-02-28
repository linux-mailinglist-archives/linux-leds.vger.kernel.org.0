Return-Path: <linux-leds+bounces-4123-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB27A494B5
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2025 10:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBCB9170FFE
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2025 09:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F81255E46;
	Fri, 28 Feb 2025 09:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSuaZ3wj"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFF51CD214;
	Fri, 28 Feb 2025 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740734426; cv=none; b=f5UDQJwseNtO8CLQaoduWwm0I8v0gWaYpqRNGuYp09wmX9qp8AuR883J82seHOHAYKw/coFz8HnHy6Gh9cUWS52u7aDwgmdayjt/r7T/htZcoO3IywUVdZR9pyBvWVB6F8ul6okXwrLQzeISgt6Nx3isBtxmun1Wpd02/WDkMIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740734426; c=relaxed/simple;
	bh=CNkAsFUaLBmaq2Qn9qI87Oim0gxHXQHPNFsURfGCn90=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GGY+yCndgp8uodSwe7v+Y6oZ2S7cvwNB3rdYzTmF1PTG8oBJF/CROvcgmXauS6WQKmjHRvgBOWO07bSSF7XmjHGQGxNN3Nh+jCKxTzpc/zaJ91NIeHLIgwVsHDgXpbs02BCfxaEeLQminIs0cEsKl6FNQMYKCKaQOlLj0JFOZjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSuaZ3wj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBB0C4CED6;
	Fri, 28 Feb 2025 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740734425;
	bh=CNkAsFUaLBmaq2Qn9qI87Oim0gxHXQHPNFsURfGCn90=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=oSuaZ3wji7d42ttR/qY9+gZc+jqZbQwC2lSwMrTYFya68ebYWIy42AuC43NS3vSSL
	 5IuzCF9ZWQw5e4CkhkIbocs7iaxlH4bcqCiOPfsqexRdahF5X4b4+Jli9oVNUF+szb
	 HB1CjcvsfgjXtzQnxpM7MC+2IH9nlvm1lk7/n7+akMjKCis/LXLJp2hfk4W0CHTZMv
	 pADnIJpzLl5sgztTOkkRUwA0aOXcVcZRmIOccqfzwTuix1nz3TnLDVSMK0LAvn83+I
	 hFf1vYHpzqB21hVBd4+25wv+GzMlFzRdYwShtPh2dmVMvYOQ1fk0rKLZYTIcxXwdzw
	 BEw1iSWDFklOA==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, lee@kernel.org, corbet@lwn.net, 
 vicentiu.galanopulo@remote-tech.co.uk, linux-leds@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Manuel Fombuena <fombuena@outlook.com>
In-Reply-To: <CWLP123MB5473552E76AE71CDE3085DA9C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB5473552E76AE71CDE3085DA9C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Subject: Re: (subset) [PATCH 0/2] leds-st1202 patches for -rc release of
 6.14
Message-Id: <174073442399.3728141.15137602784642242020.b4-ty@kernel.org>
Date: Fri, 28 Feb 2025 09:20:23 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Tue, 25 Feb 2025 21:58:09 +0000, Manuel Fombuena wrote:
> Following the feedback received on the set of patches for leds-st1202 that
> I sent previously, I am sending separately for your consideration those
> that I would like to propose for an upcoming -rc release of 6.14.
> 
> Since leds-st1202 was added on 6.14-rc1, this would avoid having to send
> [PATCH 1/2] to -stable after 6.14 is released.
> 
> [...]

Applied, thanks!

[1/2] leds: leds-st1202: fix NULL pointer access on race condition
      commit: c72e455b89f216b43cd0dbb518036ec4c98f5c46

--
Lee Jones [李琼斯]


