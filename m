Return-Path: <linux-leds+bounces-5500-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD02B53796
	for <lists+linux-leds@lfdr.de>; Thu, 11 Sep 2025 17:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20B573AB72C
	for <lists+linux-leds@lfdr.de>; Thu, 11 Sep 2025 15:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4536E338F29;
	Thu, 11 Sep 2025 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LcL7xPmI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1866B31E11F;
	Thu, 11 Sep 2025 15:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757604226; cv=none; b=sPfZYI79EJCMDDv58zT+0ZLmr6we18ZZ93h22M3/N/rATgQcmpkQ8mYqtQ2Nouo+v6HL874zTok5G88DkXijfQWlRZgdS+Hn3I/3iaqsMnrARRnIUqr6n64sDwScLDrBY/tViO+KpM9L0ruX/RLnBZ1QgiLABirwQx3wNjKhoEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757604226; c=relaxed/simple;
	bh=+pg4K8fVRosSXx4XBJB8DSGNiKGvlmpn6rOZGdp71D4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jn97eQyvTXjcu9+FOTw6IBt+chW8R4d5Q4w8CifY1DlIdlc/j0BPNZfB6U6vuViO2MqcQqRqLWOcop9mkgW2KQ5MG0553Lyig7e2eK6BpGabCrPfh6wkPYEk4ujBhmfIBRR961u9DAwCXD2f0WRlZeAYGR1+w++rZVwEt5PxTEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LcL7xPmI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E73C4CEF0;
	Thu, 11 Sep 2025 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757604225;
	bh=+pg4K8fVRosSXx4XBJB8DSGNiKGvlmpn6rOZGdp71D4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LcL7xPmIz3OHrebcSdgQ3PHVAFNxFJkVZohk0+wE2jx0QOmxVRMddfxf+rtsWAKCG
	 x4U9A3vYOcb1T3Viob4Il5ic7A94SDInd5WeTvwuWcbV1QWFMIrng1bTMpgWh5Cy77
	 JkwfhRu/bUMRXmK2j3cGfleheXYOJb6CHvb8UpV1RjVmfMW273cv1/bikzIoynCzfx
	 617FiY9F9nBkO+HoIDQ4iC5SCe9JlkmWmOGXLaLGisyt2SF+N7goRUZCv+zEgL1kyB
	 w+jhMYt1JSrNgeqU53c4C35KTtjsFxeiEkznK/Lc5tTxTny8MAVbl/Q01KNuzaVafy
	 mSalEKtcNzOWA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-leds@vger.kernel.org
In-Reply-To: <267aba6eab12be67c297fcd52fcf45a0856338bb.1757240150.git.christophe.jaillet@wanadoo.fr>
References: <267aba6eab12be67c297fcd52fcf45a0856338bb.1757240150.git.christophe.jaillet@wanadoo.fr>
Subject: Re: (subset) [PATCH] leds: is31fl319x: Use devm_mutex_init()
Message-Id: <175760422429.1615976.9555209601632002396.b4-ty@kernel.org>
Date: Thu, 11 Sep 2025 16:23:44 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Sun, 07 Sep 2025 12:16:09 +0200, Christophe JAILLET wrote:
> Use devm_mutex_init() instead of hand-writing it.
> 
> This saves some LoC, improves readability and saves some space in the
> generated .o file.
> 
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   20011	   6752	    128	  26891	   690b	drivers/leds/leds-is31fl319x.o
> 
> [...]

Applied, thanks!

[1/1] leds: is31fl319x: Use devm_mutex_init()
      commit: 96e048fa11d6aedf4add4c2f93a8d06445948056

--
Lee Jones [李琼斯]


