Return-Path: <linux-leds+bounces-6029-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BC315C3CAF4
	for <lists+linux-leds@lfdr.de>; Thu, 06 Nov 2025 18:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D319A4F4AD3
	for <lists+linux-leds@lfdr.de>; Thu,  6 Nov 2025 16:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837752E7F2C;
	Thu,  6 Nov 2025 16:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTyDg9OS"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F312D12E2;
	Thu,  6 Nov 2025 16:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762448310; cv=none; b=Shue9TjSAY4DGD0PU5WcsZyhEvt/48p74DwxwrAoG0wexLNaulJcsuoh8VkadrmdxoKHjVi1QQWlJ7nN5qprf8oQfBjxKq4BrCQWxzXtd9wrZEa7m+5m+vcET3baCniZX9crLGbtD6+BjCBGah7Fh99PcVrwPxRGBRyTdBHxHx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762448310; c=relaxed/simple;
	bh=71V4FIo2y+M4KAyJTyXGLsgHH48fxpWbne7lhs/Dq3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KnbNQiYs0wtUjIFnrFj25QlXYRT+GffWxMBi5zqr5B/kmkBtOh7UXKKnzVi/oYB48R2cj+4gmMKqc1ssgffzfo1yMDGiuJA2lgGycN9NURd0GdF3XQha3pLk/cgepbZzv8BIHzIjeL+60n+E35oTZiV0wVa4WUIquYzkz4OkyFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTyDg9OS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBFCC116C6;
	Thu,  6 Nov 2025 16:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762448310;
	bh=71V4FIo2y+M4KAyJTyXGLsgHH48fxpWbne7lhs/Dq3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZTyDg9OSjzmgeEwzWEwqhSpnBgTVq4stc9rd5Z6n7W/bK50KLnuUCxpIBswNgVlXf
	 S9KjsyO8ojFjY7qCyHpYvw2oYybuWL7TGvyqnImyFhGEtNsOG3MRbpBNdzHjCo8WeL
	 RFwZjIzwqF4DsQoMpDUuj/WzUl7HXJdDdSNq/v16wZYwwTC/peMR2tNCmoKAQw+WCT
	 zT1M+EXq1hXwGb9xvc4FGUwgsuy+TQq6air4HfPOWOK9J+yS4wTqWnpDW1UhmNp2DI
	 eb4OMFTqka/AyVa/lJ2sn7AWULQrSdxGNmloPQXFaI47OciyRR8no0Njv3kzRVm8nE
	 guSJcDEspmAIg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
In-Reply-To: <20250729-expresswire-dep-fix-v1-1-635cd4cc746b@dujemihanovic.xyz>
References: <20250729-expresswire-dep-fix-v1-1-635cd4cc746b@dujemihanovic.xyz>
Subject: Re: (subset) [PATCH 1/2] leds: Drop duplicate LEDS_EXPRESSWIRE
 config
Message-Id: <176244830776.1960780.8531286743558641469.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 16:58:27 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Tue, 29 Jul 2025 19:18:29 +0200, Duje Mihanović wrote:
> While moving said config symbol out of the "if NEW_LEDS" block, I
> accidentally left a copy inside that block. Remove it.
> 
> 

Applied, thanks!

[1/2] leds: Drop duplicate LEDS_EXPRESSWIRE config
      commit: ea1c4c7e648d1ca91577071fc42fdc219521098c

--
Lee Jones [李琼斯]


