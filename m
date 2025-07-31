Return-Path: <linux-leds+bounces-5183-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2A7B17283
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 15:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D908624731
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 13:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B572D0275;
	Thu, 31 Jul 2025 13:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZhC1KhQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4AE2BF00B;
	Thu, 31 Jul 2025 13:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753969991; cv=none; b=g7YLMqWb5z7Z6jKvoKOczrkmz0CcijhbAi3xRlfBUTROR8OKdvxYH6rHHWh6YvwOmsX1JloBUI2aRTO6U6etCffujNVV+oDoTnRW1qqGbfwLHOPqyWxB8JhPNBxklFfsGOF+9pgf8DmU/CihH4N5yjfnjnbxeZeS+em/xqJwZ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753969991; c=relaxed/simple;
	bh=AZrEvd5CkZWyj2crdtUevGjO4dk8FdeJGcOeI+4NkwA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=awzjFUGFhfFPVH1qD7L6ZMTGcXbbb+rlFlom6FsTYMmFXCQ/Hsyij1H4OOvH6Yl4VA7wFbaleFsNMpDXN1lMTFQALmt9ppfOyzCi1SHo+W7OiVvTh4Fg+1bW9TdfFDYCdO3HQ0TzLayPbihO0r467/E4UV6Aedk5Pwwrr+ENnIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZhC1KhQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90E8C4CEEF;
	Thu, 31 Jul 2025 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753969991;
	bh=AZrEvd5CkZWyj2crdtUevGjO4dk8FdeJGcOeI+4NkwA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aZhC1KhQIIxpXpr1iC5fjtrGE6hrEZujJPYV7+3pe5MIgeI9gWwwmOrJFXfIRjca6
	 vLzA2j6aEGujaOtxB70IQwgNDeyWQ1MxiaYLIx5uHzK78cH76N8oNoUSA3Gub/8W+k
	 jqOah13m1e9kIdIIixln8+CeGfIPrY8PbFZJa2TOZ2G4S0gjrZbRPc/gHgcW7W+w1u
	 u2oVdGWLvwS0OnHjnTW8rHKpWIEKznW0FS6QlrXcTGBSuxv4cpY8MjrwGgbJNV72C6
	 DwD/EiznBVS1EIUIqIcmOIhMyHToE/DEoJw5MdzuL01/qKGT6oUfvwrXZaV73mWA6N
	 q7QmAzl3bwCWA==
From: Lee Jones <lee@kernel.org>
To: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250729-fix-torch-clamp-issue-v2-0-9b83816437a3@oss.qualcomm.com>
References: <20250729-fix-torch-clamp-issue-v2-0-9b83816437a3@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] leds: flash: leds-qcom-flash: update torch
 current clamp setting
Message-Id: <175396998963.1216636.9777141623306195589.b4-ty@kernel.org>
Date: Thu, 31 Jul 2025 14:53:09 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Tue, 29 Jul 2025 12:51:21 +0800, Fenglin Wu wrote:
> There is a current clamp register needs to be updated when enabling
> torch LED, and the register address is different between different
> PMIC flash LED modules. Add changes to address it.
> 
> 

Applied, thanks!

[1/2] leds: flash: leds-qcom-flash: update torch current clamp setting
      commit: f1b908cc8c7110872064e4a55a88b34938b4054a
[2/2] leds: flash: leds-qcom-flash: add a separate register map for PMI8998
      commit: 82f1f0522cad9193a42593b9e9622433efcf5f26

--
Lee Jones [李琼斯]


