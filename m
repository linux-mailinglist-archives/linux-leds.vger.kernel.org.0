Return-Path: <linux-leds+bounces-5366-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DADBAB400CA
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 14:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A7FB3ABDED
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 12:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440B522D4DE;
	Tue,  2 Sep 2025 12:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHd31ghZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9C822B5A5;
	Tue,  2 Sep 2025 12:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816466; cv=none; b=QEBaNZLkK2RSvBEIv6ApeU2ubkyrRLmSe8nWya6GwP0hLZgy/KqKK6NyOmS7GBC58EzFwVufdCdpDOWs7nLi7dof2PrgX30bymYbP/Q28UQGNSJdDdU2rUjZrtZ/2DsbsRHXo39qwf8BAQ8OvDvkpk6c+2tbpeKKDYgv7S1TgX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816466; c=relaxed/simple;
	bh=G5l2yPhZimlRn3MMmoCDLaBxWlhPsHzOaxaPwHN4qyk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=C1BSx4M4A6m+6yZAInkkDYsCYbleAjZPfTpmGtwiITq69IC3NgGkawgtFM5tjqGyHOrZgUm02hOdC6YXFdbNPxSUlDUK732LkN/pSlyQb3IGudLzVJT+zW5287jZio0RxC79UzVqYUKzuIyR1jbnKNkgEPAMTjemjG71WdUEcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHd31ghZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3A1C4CEED;
	Tue,  2 Sep 2025 12:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756816465;
	bh=G5l2yPhZimlRn3MMmoCDLaBxWlhPsHzOaxaPwHN4qyk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dHd31ghZmfzWSPrTmAKzWSfDAC2/PZflPhyR9RN85mudFfUmOt8/yF2GbLMcce3UL
	 g1Jor9K7l926Jyrb6qRzpz0P5S9wMEJwTfNniR0ZX+89j8R4IusaHmEMELktaPOoUa
	 F9NEVm9aOKlDLuFZr5LXHNgW1TfPp3p9K9NVXK/4EIzDQ8l6RwZb/ru+nrJ6U8q33D
	 wtduJmrlGteQNg2jFQis4mPRvlRPI7UuEVsmUXZ5QLIqgojKjaRtOYnYyo5DEbBvJh
	 NoDysUok4NWZNkN6m80Li8ox6k/R4z121jKR+2v1m/qPTJFhvlOF137JNydMgW5Nmi
	 goa2qQTnbfM0w==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Andrei Lalaev <andrei.lalaev@anton-paar.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250820-lp5562-prog-mem-address-v1-1-8569647fa71d@anton-paar.com>
References: <20250820-lp5562-prog-mem-address-v1-1-8569647fa71d@anton-paar.com>
Subject: Re: (subset) [PATCH] leds: leds-lp55xx: use correct address for
 memory programming
Message-Id: <175681646443.2328142.16671286354720773270.b4-ty@kernel.org>
Date: Tue, 02 Sep 2025 13:34:24 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Wed, 20 Aug 2025 10:47:12 +0200, Andrei Lalaev wrote:
> Memory programming doesn't work for devices without page support.
> For example, LP5562 has 3 engines but doesn't support pages,
> the start address is changed depending on engine number.
> According to datasheet [1], the PROG MEM register addresses for each
> engine are as follows:
> 
>   Engine 1: 0x10
>   Engine 2: 0x30
>   Engine 3: 0x50
> 
> [...]

Applied, thanks!

[1/1] leds: leds-lp55xx: use correct address for memory programming
      commit: d6058316d16ee0d1861c0550051b2492efb54b79

--
Lee Jones [李琼斯]


