Return-Path: <linux-leds+bounces-5180-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F7B17087
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 13:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE6BD7B19CA
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 11:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933FF78F4E;
	Thu, 31 Jul 2025 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alUodafg"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DD12AF07;
	Thu, 31 Jul 2025 11:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753962382; cv=none; b=PKOx7Ift2fEUJsaOvhxa1zXPIzlFMkieWSn/j8W1SH2QvetXJrZkZfiD13+SL/2ObyrHxbJnZWkhHglFGZ4NUM1CRrC6zJaqBEmhghkYt7pxQjC+P852aN4R1uVpuTD/ySkCWghl/15muXaTb7ejW/nDBGkCBLHVnEgVKvoSkkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753962382; c=relaxed/simple;
	bh=utKrOhEhpWoPeImo/wE0KSLcWRmsUuUVL4esC/9G1p4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BPkve4EP/Rot0HStVJLXmDuxgw/ZBziPjdBIZz3Y04MK0WHTZqCPJP+Pq5TBp1YnD3a5a3J7XVcdCYZBIsz7nIHiAuxkLibv8f0hm0rojWQYPFcSwX6eJCHxnmkz0Jlbz9egjnDW80KvTzGAKRfYWpYJOJIHIL7Ik15myMTr9uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alUodafg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8492C4CEEF;
	Thu, 31 Jul 2025 11:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753962378;
	bh=utKrOhEhpWoPeImo/wE0KSLcWRmsUuUVL4esC/9G1p4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=alUodafg5EyFB5v00Lop95dfE+kWXx+6B/yUxC2PKdwjAvcTovwACWcONA7im1CmV
	 cmBS59yfp005WyoA+x2crUjRPM14eL19gW1QqKr+BijDpjGPB3foCGy3MBXKfSUO+T
	 Q6q0KSVOk2551JYigzRA8fvZv5wPafgCjbazUo6e1B+97u8C08FSKG1RaQBxqtzlUC
	 j4e6T+etegKQhI7lms1R2dAAUbhqdUzw+Ptwc/X8ZjhLJnv9NTWz/dHC+I+I9iMGmw
	 LogpHEQDRG5yzrpGv0UoKvyl2Aj0km8Roo+bbv2O2NxRcWYAnSUxa5TPWLz3oV6twK
	 NBofE/fdiP0rQ==
From: Lee Jones <lee@kernel.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Len Bao <len.bao@gmx.us>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20250727075649.34496-1-len.bao@gmx.us>
References: <20250727075649.34496-1-len.bao@gmx.us>
Subject: Re: (subset) [PATCH] leds: max77705: Function return instead of
 variable assignment
Message-Id: <175396237638.1157697.4618509663865868020.b4-ty@kernel.org>
Date: Thu, 31 Jul 2025 12:46:16 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Sun, 27 Jul 2025 07:56:45 +0000, Len Bao wrote:
> Coverity noticed that assigning value -EINVAL to 'ret' in the if
> statement is useless because 'ret' is overwritten a few lines later.
> However, afer inspect the code, this warning reveals that we need to
> return -EIVANL instead of the variable assignment. So, fix it.
> 
> 

Applied, thanks!

[1/1] leds: max77705: Function return instead of variable assignment
      commit: 5913b60c2851102d51469ae7a2a69344a3a83eaf

--
Lee Jones [李琼斯]


