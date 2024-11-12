Return-Path: <linux-leds+bounces-3396-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 142359C576B
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 13:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B574128152B
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 12:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164D81CD211;
	Tue, 12 Nov 2024 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tND01iue"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DD023099A;
	Tue, 12 Nov 2024 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731413680; cv=none; b=CN5/peyvVUzEiDIPLzCmyezaJ7QhCOaYWP8s1tqIsUrXCXkOcy2EeizyyqnBun2vwNSkxRySNGUcziCk834NFi9isdYt7JN4hUOgD6uwgYo947P3CJclHwh76TNtMQh+InSVjBUn13iKVNTUX/PO1UZu5v+V0Xv+lZYCvevsnJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731413680; c=relaxed/simple;
	bh=bZo9B5FPwk5oUP/7ldl1s9NXKEqc5S/i0a9+AVZN8nA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WDOCugnCv3McVdx7/DAhMeM+XFCaSZHCagDvaPZo5DJeMlO5Iht6lpNve/VYJeDwRYvy/sfwdNYNAF5FOZuhjmsZLZrU8jKMeNQWqzlBoHaAo84tPta2wGdvII7Lg0fLPnlnmaLiKaJ2Z29tw21O65DSs2pMs9C5GXfPMfyKYCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tND01iue; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8C4C4CECD;
	Tue, 12 Nov 2024 12:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731413678;
	bh=bZo9B5FPwk5oUP/7ldl1s9NXKEqc5S/i0a9+AVZN8nA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tND01iueGl6iUn1Mqwm+OkvE/yuNrBuWXlNqG4L5FUSrPsRoP8HIffnSwYmVF/U/J
	 h1+bBHJjeknFu7XNnPiQTW3Jj2pvaxtlgxWW1zK4ZyI/8SGO4lqqOzkP3VkR4g/pzO
	 +64y6oJipne+mkwdHqO9KkvLLPDkUS1UkE/g1xK5v8UUKksszpxFi4HHjO/+Po57Cz
	 g8vvo+G26j2wKeO32LG9u6ZVnsUHEaAtlDIKHdqHAFysQFWqalzCUobWv9ZwNVat3c
	 o++GdiImlKksx+UVL+OH7nHRcQnMrz22Pu0NM+9buUv6KSP64+TqsQIiPOeyfKuJsA
	 ceIaF0Tx+DWWw==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, George Stark <gnstark@salutedevices.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@salutedevices.com
In-Reply-To: <20241105185006.1380166-3-gnstark@salutedevices.com>
References: <20241105185006.1380166-1-gnstark@salutedevices.com>
 <20241105185006.1380166-3-gnstark@salutedevices.com>
Subject: Re: (subset) [RESEND PATCH v2 2/2] leds: pwm: Add optional DT
 property default-brightness
Message-Id: <173141367623.792236.15443018067609140309.b4-ty@kernel.org>
Date: Tue, 12 Nov 2024 12:14:36 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 05 Nov 2024 21:50:06 +0300, George Stark wrote:
> When probing if default LED state is on then default brightness will be
> applied instead of max brightness.
> 
> 

Applied, thanks!

[2/2] leds: pwm: Add optional DT property default-brightness
      commit: 8cb08101835d98fd69cfa2a2b06146eddc057df6

--
Lee Jones [李琼斯]


