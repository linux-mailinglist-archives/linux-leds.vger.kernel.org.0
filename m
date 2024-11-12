Return-Path: <linux-leds+bounces-3399-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3354C9C5DCC
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 17:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 421D8B66BD5
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 14:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841DE1FEFBD;
	Tue, 12 Nov 2024 14:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FuFoU2lU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D25D1FC7DB;
	Tue, 12 Nov 2024 14:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731422388; cv=none; b=aKqThtMn1bASnAmeYmfOyhd2gWfhWBMIkVhBW0Nx/4WFsQKr9FfXvBQhaDXdDnNG1Ugzu6eU4xElXNC8llhhQEmEg1qQ0mwUUNeOsOHi0F7fQEgYAhN8IkT84/hUjt1tN96/oRBVbFFpWEHFxUU7syew5GgKOZxOc/RevSVs0Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731422388; c=relaxed/simple;
	bh=h+Ap1UYmumlL6gG1vdcW9SU14O90wtfm1BMWAfDBOPs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jml+NbQR4QvMTE3ll4vdTpyTYwwnhIyyRlfbXV97ZGP0N4tlhntfZXH0tkxzhzxnaE8mUekCvfcePEjbdJ1UdJCZjPkEP132rOriA/nqpusFaPeUhRSUM+G2e1081jEArxYzMbzPM1x02XM3MvZ0236zCvbdWxadm9y8ILv0VEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FuFoU2lU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89F8C4CED5;
	Tue, 12 Nov 2024 14:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731422388;
	bh=h+Ap1UYmumlL6gG1vdcW9SU14O90wtfm1BMWAfDBOPs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FuFoU2lUtwt3zcOo4qnjMahL7XmqIB8P622fzGetKnVXWI+SkfiqkOGVbo4BEvfEm
	 ZSX1k6lDC6UBWax6rOSMt3VBySsFTUBSsrWVziKipoPA+hjiUffbQGPz+RdJv2M9we
	 C/15j03yylZ9eegISAsJ+H0ZYiESJBya79BTN9tT6MQd1nRPwgM56nEEldU2UoZvHB
	 azJNdAOoQI4iwqg1nr1JMm3lpNlPt9/TQqmZr7bHKXrbG52QD0uJVg/+DSpOjjK7SD
	 xyrBeF9m60F2jfsyKQ0SWNJKf4tLcwQgqQ7suTxrOuysaD51DB4o/9wdRmmPPMYzLY
	 +oCLSJZ8r4wKQ==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241111065809.3814-1-zhujun2@cmss.chinamobile.com>
References: <20241111065809.3814-1-zhujun2@cmss.chinamobile.com>
Subject: Re: (subset) [PATCH] leds: ss4200: Fix the wrong format specifier
Message-Id: <173142238668.1047294.11424895725002242081.b4-ty@kernel.org>
Date: Tue, 12 Nov 2024 14:39:46 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Sun, 10 Nov 2024 22:58:09 -0800, Zhu Jun wrote:
> The format specifier of "signed int" in sprintf() should be "%d", not
> "%u".
> 
> 

Applied, thanks!

[1/1] leds: ss4200: Fix the wrong format specifier
      commit: e8501858035b1f95468da525e7357c8c33811b88

--
Lee Jones [李琼斯]


