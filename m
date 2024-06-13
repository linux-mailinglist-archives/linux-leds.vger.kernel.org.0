Return-Path: <linux-leds+bounces-1909-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 534039077C1
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 18:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F10F11F23A0E
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 16:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FFB12F5A5;
	Thu, 13 Jun 2024 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLeF/HQO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D37A23;
	Thu, 13 Jun 2024 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718294729; cv=none; b=n5FhLUs2m9/OwvIXtfoflWIQaVtH7zmze5muXsY5cRaoDOcVPE9DTDBvsyrbkXXcRMLsGUToef6UACVOynAe4fJ+Y0x0dmZdJ+UqDA2sbjJelyp178CSNzg7WvHQlXkKR4eF5C+QjCQYi33w+J2R1MoX01m+fHvwkohUeF95lPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718294729; c=relaxed/simple;
	bh=U2DZFhk2lxQx2CBbCuMlAdQcXwrsdEgd+K6QLu2lto8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l0yAYgsoSRYbzNxQk1jvSnS8hKwFNsKpPjLEFghRB57Ib+UvCC5sUcHtHO9ERqB6M6pT52RXtTp9WLrlXPomFF6rm69gr3y0Fw0yggDy7KAIveneVVnQqcGOfb7q3WGadg9DY+acwz3N/leeOYa48WPKAhwf08mgzOJqx9R2Db0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLeF/HQO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A7EC2BBFC;
	Thu, 13 Jun 2024 16:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718294728;
	bh=U2DZFhk2lxQx2CBbCuMlAdQcXwrsdEgd+K6QLu2lto8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FLeF/HQOtLqo+pJOxkvgP6f+npFza2mYyZEn0wPldijfRnbpDfVvBlsiMK9+xTIXC
	 ZUoy11AjbJve8ssJKi5C06SrUmfu6Q3N8VNn2kpk+VU83IXfmMjpc5OvJr+pIERiyP
	 8wNszMDSSDMgD9o+WcT5HG/GYnCh66UG8Xc+HsX/kNu+HJL4Q+Dcs4HBePT7/fogiW
	 MnFTb5gW+tELGypS7FD35Qawm5vGKvBtZc38gvA0XhL7HwQR0vqO7vMOhcNmkoPjSX
	 zGJIHjL0hmnho/MBZI9XhhkZvL/F31apm5ptMYAVP6XHulkxRJk6lrHCCcSYuX+rwc
	 +8tLGzFftnOnA==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Abdel Alkuor <alkuor@gmail.com>, 
 Pavel Machek <pavel@ucw.cz>, Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <5faec5de-fc36-4b38-abcb-c61954a824cd@web.de>
References: <5faec5de-fc36-4b38-abcb-c61954a824cd@web.de>
Subject: Re: (subset) [PATCH] leds: ncp5623: Use common error handling code
 in ncp5623_probe()
Message-Id: <171829472766.2690295.11956614512841828.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 17:05:27 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 05 Jun 2024 16:30:30 +0200, Markus Elfring wrote:
> Add a label so that a bit of exception handling can be better reused
> at the end of this function implementation.
> 
> 

Applied, thanks!

[1/1] leds: ncp5623: Use common error handling code in ncp5623_probe()
      commit: b234df8016fc73468dfff2ea91c5b150bbe6f692

--
Lee Jones [李琼斯]


