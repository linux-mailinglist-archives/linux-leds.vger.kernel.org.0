Return-Path: <linux-leds+bounces-4335-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFB5A6B805
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 10:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A1CF3AE639
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 09:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC041E990B;
	Fri, 21 Mar 2025 09:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6xDcbkX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3370833F6;
	Fri, 21 Mar 2025 09:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742550513; cv=none; b=diOymEG1MJM6RPyI8/VqP7p7IYysN4f31C+lw/LOk14MMhfgGHPSvP+73WWIjlf1S6FvKOLG4aQXVsH3i7aGavzFS/EuWkT4OWYAFwTSFooovZ6/bhCS/zogKVeCnZEApY5oDiNIDDnYIhwn5DM9SpTyoVVlcvg3s6daQy8STwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742550513; c=relaxed/simple;
	bh=Pzxsh1tssbivF5XN57QgqO3hYlmnMbinWqJXSYAczTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c9REfKzvvn+YneS8kn87cUtO6mRKJf52UlYVWOVfuNeECrQVTxN4JPYnmZ/PSU2Bm30C75N6TH0noxCQe7xHuh1JONVCtj2k2cj/Un73CFbxZSF3rztZm/JCOkb2oLxqn8PchD7geShJlObe4y5U5bnCJGayI1o9scdylcskD3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6xDcbkX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8649FC4CEE7;
	Fri, 21 Mar 2025 09:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742550512;
	bh=Pzxsh1tssbivF5XN57QgqO3hYlmnMbinWqJXSYAczTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J6xDcbkX7rEqS0CsDDfP+4xvN7OclkYYjxfSd9XaioFWhTl8qFc/4ezfPwUHOn617
	 D1XFzd+Q7iSjXoRCzuQbdBFYaqsfl2uu2OJ4AFM0U3sXC1XExjizCiRBII0ifQ9q4t
	 Zb62ybfu8YY3+n/9T/uD/+m2ihvV7dK5ic4xwn9Cpg5TDGDKQZ9kQ3ZAn0paERQ5Zf
	 AR7YXsLBdAoSP5mKBQGOkGDM5OvwkO07OKk+mFNW+H6reQ1ajgPbzXQZ8TLRg16f2h
	 CH/3MgFRzDq2ojStBlpdA+xJvpBmSTMHSZa4jfJFStWGrzbHUXJ1AhWrb7dGzybE+9
	 swxKV4kkFKvEQ==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Vadim Pasternak <vadimp@nvidia.com>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>
In-Reply-To: <20250313161206.415160-1-andriy.shevchenko@linux.intel.com>
References: <20250313161206.415160-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] leds: mlxcpld: Remove unused header
 inclusion
Message-Id: <174255051130.2017123.6711916388140826423.b4-ty@kernel.org>
Date: Fri, 21 Mar 2025 09:48:31 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Thu, 13 Mar 2025 18:12:06 +0200, Andy Shevchenko wrote:
> acpi.h is not used by the driver. Remove it.
> 
> 

Applied, thanks!

[1/1] leds: mlxcpld: Remove unused header inclusion
      commit: 52fc80729b06501c5609b91b168be8d9d5d79994

--
Lee Jones [李琼斯]


