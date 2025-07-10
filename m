Return-Path: <linux-leds+bounces-5028-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9362FAFFC2A
	for <lists+linux-leds@lfdr.de>; Thu, 10 Jul 2025 10:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE6AD5A6920
	for <lists+linux-leds@lfdr.de>; Thu, 10 Jul 2025 08:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6661028C5BA;
	Thu, 10 Jul 2025 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i6Ukh7Hf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B463286D55;
	Thu, 10 Jul 2025 08:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752135992; cv=none; b=AdK4Y+2aeCh5nsg9sHwZsbfAJTiKW0JWIxr6LS7+CHtrBFhKPYru2FEeoM3AsTo/gg5obmwWAX0dNUlMooKv69KDaQgf8g8vYtA0DOu8BavGlycnkGj0M8IH6oTqyd9hZUa0fYhPIzIjlAiiWnX7BIP8ZLBpctf2IDZNigwn9CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752135992; c=relaxed/simple;
	bh=HR5jT4TfR9dgvhvAv2NUueOaibYM4bLhFhUoHZZkt0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7oCALPFxabVgEgXUoQ26D5m4jWsctA0pihO9VZIDXi9EAQ5pHdpldcf66hK9qMZ8N8LI5lCchDXaxhPDYw7NzdnCC/Zw2p18ACUAk2iD/w2sWTz81kklUabKRL3+gdS0/IVlAVawYn8bN/4pn62PgTMPCCSQJlrsoTbPu5gj6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i6Ukh7Hf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B9DC4CEE3;
	Thu, 10 Jul 2025 08:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752135991;
	bh=HR5jT4TfR9dgvhvAv2NUueOaibYM4bLhFhUoHZZkt0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i6Ukh7Hf/0mjLerL6BfgIZFNUs44eeX6ZBqDw3EUGLvf7Ox3WPbh2+jxYz5xvP3ly
	 Td6gEpgERBDmw+8D8G1/n54qoNcFXnWqO+oHqDhCbBRzXD6f0tbVhIOZ/Ms9/BWTAb
	 cq+hjPz9mCB7dka6AyZOvp77zjstzeAHJ4SvMFwTUc0tO8er/aA48fNDn0mHLQ8gBN
	 IoDlM74Y0g8kzUlXhvKavDaDGlvI+wmUSLD0C1BW6Q6fpKWf5Ku7BJznT83aZzR7sT
	 1SIULl1Crg8ArPN4TMbgXCYyQZKnQG0ZEU5J65e6TI3B3Cv9MmOkkUMUCfl+O70tDq
	 WFBRZcnYtTZEA==
Date: Thu, 10 Jul 2025 09:26:27 +0100
From: Lee Jones <lee@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] leds/leds-is31fl32xx: add support for is31fl3236a
Message-ID: <20250710082627.GC10134@google.com>
References: <20250627-leds-is31fl3236a-v2-0-f6ef7495ce65@thegoodpenguin.co.uk>
 <20250627-leds-is31fl3236a-v2-1-f6ef7495ce65@thegoodpenguin.co.uk>
 <20250702162230.GY10134@google.com>
 <CAA6zWZ+5rr_wa6zqQvqKc7F=j4aVgJkL9c-9gFSjQ+0CkQx4bA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA6zWZ+5rr_wa6zqQvqKc7F=j4aVgJkL9c-9gFSjQ+0CkQx4bA@mail.gmail.com>

On Thu, 03 Jul 2025, Pawel Zalewski wrote:

>  > So close!
> :)
> 
> >  This should line-up with the '(.
> 
> Spacebar to the rescue it is then.

Your editor should be set-up to do this for you.

If not, yes, spaces can follow tabs, but not the other way around.

-- 
Lee Jones [李琼斯]

