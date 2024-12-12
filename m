Return-Path: <linux-leds+bounces-3593-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0929EFC00
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 20:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 220AF284D79
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 19:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23F918A921;
	Thu, 12 Dec 2024 19:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qc6CACI8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB02189520
	for <linux-leds@vger.kernel.org>; Thu, 12 Dec 2024 19:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734030251; cv=none; b=HQTEROmCCEq0Rqm9vI79ZzlwEExhrJt/MqVmWuPDqo3pQATBcRdijM3qKiQOZsHAiSesMBr602IY++egWUMWSA3H9nIdkG+F9WJMw/86ydSsc+KlP1r/Quwlb7eTIaavCVIlwMGc/OPiwODlXf9vw0rEusn5zWUcoehErBRCw6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734030251; c=relaxed/simple;
	bh=mvrngwoS7voi2/nQwfp15c+0kxUHFYVDriXPqj1OlJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fagcKEcDecUdHHsx9G3/TgVjA9qTvVWClFGgdlCZv74GmOAUu0OInLKN5jz/+Qi13xhvJj8Nz4KmN32pVM2mbgc04jBT00cjnyVMVhxS03iy19T1EeStgp9lERUH+LWyy7FUqHdz1mpunyFAXjgUy1DkGCV7rRbblku1/lNSe2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qc6CACI8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94FC6C4CECE;
	Thu, 12 Dec 2024 19:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734030251;
	bh=mvrngwoS7voi2/nQwfp15c+0kxUHFYVDriXPqj1OlJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qc6CACI8JZT3XbnMwyUCnfUQCb0/vl3CDtPtPfk7zvPueLB6BtsyQ8q96K/YiphDb
	 cqDm9q8ObDyeq7PFXrUgdq9bICti6W/vv6vkt9hEM7kZ5Ga9MgxA46QlgOM70JpmLX
	 LMAHf6xeUMlDUvlwXuOaFxoprJ5smKcbdFRN9RsG7BgABk+eBs6CquoDfaMfkX1QiE
	 Nl8eTpatijYhWwme/VPaCSh+ZjNVmKHXIvxoKEo8exNj1jD4jyerQqzbgjHfmL2NKc
	 5vBmBkTHve1HiN8SnJWumxuQ+lv04VBsxsYUwrMu+xyCuOfujTvPjEep9hiMulqLEQ
	 1aDc/aUFxg9Qw==
Date: Thu, 12 Dec 2024 19:04:07 +0000
From: Lee Jones <lee@kernel.org>
To: FUKAUMI Naoki <naoki@radxa.com>
Cc: linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: pwm-multicolor: fix multicolor PWM LED lights up
 without any setting
Message-ID: <20241212190407.GM7139@google.com>
References: <20240816102626.826-1-naoki@radxa.com>
 <20240821161119.GC6858@google.com>
 <A85312FB70235D56+bd5fad03-36bf-4df9-ad44-7f7eaa7b2aa9@radxa.com>
 <7DDC06B563854ED8+65e7204f-76df-4f36-8544-bede36a519fd@radxa.com>
 <303538E55468284B+287412a2-b1dc-45d0-af5d-c33c0c63acc5@radxa.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <303538E55468284B+287412a2-b1dc-45d0-af5d-c33c0c63acc5@radxa.com>

On Tue, 10 Dec 2024, FUKAUMI Naoki wrote:

> Hi,
> 
> Could you help me(write good commit message), anyone?

Surely you know what the changes you authored do and why you authored
them?  Write out a nice description in your first language then use
a free online translation tool to convert it into English.  It doesn't
have to be a novel.  Just describe what you're doing and why it's
needed.

-- 
Lee Jones [李琼斯]

