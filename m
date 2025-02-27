Return-Path: <linux-leds+bounces-4117-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7ABA486F0
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 18:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16F4F188AAE5
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 17:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16C51DF73C;
	Thu, 27 Feb 2025 17:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eq75lu8C"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5FE1C5D7C
	for <linux-leds@vger.kernel.org>; Thu, 27 Feb 2025 17:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740678478; cv=none; b=uRGDE0vzK3RKPCmTFxHLvUQ8hUEIjpGDzNdS+cGhfGZZjoEKVwhzYkK8440b23M/WnRujtbSwYnczi+HCqmOhClQMIa9dvqMjenh2m4dr9SV7TUwKK2N+KV6sAp1ti1/5JlAgNGdGu8eowbgLUfAzbLAuioEUG6Q9LwELLTFotk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740678478; c=relaxed/simple;
	bh=0UWHu7nd959qYI4FulTh1tBO3BvEIlyyCsjdrHXpsY0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I0/bL5nXoCcDwHd4SCs1JLSGq/A+oM+iXs43VQavopih7Ouu9kVbX//Bw2DKiZg7/N90EWg8T+7Tu8MoU7NKhBZieT7e84pjtdb1diWXYo0c/TRKiM01c3DI6Q0QtsjW33+V5Q9Iuw7ckATDt8UdmyVsv+pmao0Twrfm36Cl4Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eq75lu8C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D52C4CEDD;
	Thu, 27 Feb 2025 17:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740678478;
	bh=0UWHu7nd959qYI4FulTh1tBO3BvEIlyyCsjdrHXpsY0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Eq75lu8CiQSU6whES33F9P5idVMenhxKOjzOZy9C3fZmU6U0XTbhsIVZW+rYvZw0a
	 KiyHKqK31ugIVrPdWc3x0dHchy1F99cNUe23qqNBZ9gJ6AMDEUFiC2bqgRSauD9d6V
	 yXoLlNYMmanQxtBKdkS0DUGH2VvEBmti3j5+CJ0PBu559yjGGIWxWKbCbQxZXKLEzA
	 it1oH67jYZram/ZNw06pEfhX/rFNlHWWfw9MuVlZHN1tpRT5yC1CsNa7N8O2gW+2XY
	 FyAlWzuArt3QqSdxAleayV3RkGxDm/KqRVMGR3g0gzRnTMeeITQd/MdhrD5iG0YGhB
	 AEmWPf9oGnu1g==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jakob Riepler <jakob+lkml@paranoidlabs.org>, linux-leds@vger.kernel.org, 
 Yuanjun Gong <ruc_gongyuanjun@163.com>
In-Reply-To: <20250223121459.2889484-1-ruc_gongyuanjun@163.com>
References: <20250223121459.2889484-1-ruc_gongyuanjun@163.com>
Subject: Re: (subset) [PATCH 1/1] leds: pwm-multicolor: Add check for
 fwnode_property_read_u32
Message-Id: <174067847676.3624381.8886533945039198770.b4-ty@kernel.org>
Date: Thu, 27 Feb 2025 17:47:56 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Sun, 23 Feb 2025 20:14:59 +0800, Yuanjun Gong wrote:
> Add a check to the return value of fwnode_property_read_u32()
> in case it fails.
> 
> 

Applied, thanks!

[1/1] leds: pwm-multicolor: Add check for fwnode_property_read_u32
      commit: 6d91124e7edc109f114b1afe6d00d85d0d0ac174

--
Lee Jones [李琼斯]


