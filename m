Return-Path: <linux-leds+bounces-4797-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6598EAD8D8D
	for <lists+linux-leds@lfdr.de>; Fri, 13 Jun 2025 15:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F18127B153E
	for <lists+linux-leds@lfdr.de>; Fri, 13 Jun 2025 13:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C1019007D;
	Fri, 13 Jun 2025 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pvyzoAtz"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E3818DB24;
	Fri, 13 Jun 2025 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822369; cv=none; b=dsUNQdcKzQvp2VRhEeDjf5Cws2Ky12DF/YZAS9w4NmX9p6GDxujpmg9A9YXECNTM88bwasgcY8/07x5fnUtfUnz6S9vKn0wEApx+fJYiTGYz4jNWe4QGQJB+bAWxr+aBdOIuVpFDEQurZPVf5+2gaZ2LnFAfSck8IWdCqBEwT34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822369; c=relaxed/simple;
	bh=l3KlaDgTioax3Nlz5KXRXJnNHjo/8LCMbwIJ3eWHe1E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RfSWnfhwwngLcmutT4lCGx71NWDrQBx3YM3SbreU3n8V0h/pI8JQKnwjEPTZzY/aVW1BC1yu9QUTUYgz2qQNe+JfmjnvGS+/zPihJ/OhY6cRoADOFEAUyLW3rmPoXih4BArdfaaQBO15Ya19rZ+CCiFShAfzgstP0aEERB2HM0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pvyzoAtz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB8BC4CEE3;
	Fri, 13 Jun 2025 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749822369;
	bh=l3KlaDgTioax3Nlz5KXRXJnNHjo/8LCMbwIJ3eWHe1E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pvyzoAtzSzYxuPMKbala3dBzIzyeFEXlpFuO+NqiPtTpLwq7npxmkb1xQ2FxnfrvB
	 mSzWdoI7D4l5q375CQQ6HLGmliUGd546I/BF0xGVwWGxGEUwIztFNetKYWyf9ZdX0G
	 8qoxNpA/X2abvWISzW2JyB38faKznHrAkQhR+Mp0dLNZDlAa4XXTzS58aWyuZRkj7N
	 kWLgJ9/BSbepv2RYiVJX8qmOeWLdwns1/ZwT38VSGwBpYacYeRzw79k6yllRonLfEL
	 JwhEQ/k0rSGzGBNmVS9c6+lrwxz47lrljDxV1xd70kPdqrTIB0/y3BuMJqSXe3+TTq
	 u2L5FKuNMZ+zg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
In-Reply-To: <20250529063335.8785-2-krzysztof.kozlowski@linaro.org>
References: <20250529063335.8785-2-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2] leds: flash: leds-qcom-flash: Fix registry
 access after re-bind
Message-Id: <174982236738.906599.2474133054869999823.b4-ty@kernel.org>
Date: Fri, 13 Jun 2025 14:46:07 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-459a0

On Thu, 29 May 2025 08:33:36 +0200, Krzysztof Kozlowski wrote:
> Driver in probe() updates each of 'reg_field' with 'reg_base':
> 
> 	for (i = 0; i < REG_MAX_COUNT; i++)
> 		regs[i].reg += reg_base;
> 
> 'reg_field' array (under variable 'regs' above) is statically allocated,
> thus each re-bind would add another 'reg_base' leading to bogus
> register addresses.  Constify the local 'reg_field' array and duplicate
> it in probe to solve this.
> 
> [...]

Applied, thanks!

[1/1] leds: flash: leds-qcom-flash: Fix registry access after re-bind
      commit: fab15f57360b1e6620a1d0d6b0fbee896e6c1f07

--
Lee Jones [李琼斯]


