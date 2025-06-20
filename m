Return-Path: <linux-leds+bounces-4865-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AD2AE1548
	for <lists+linux-leds@lfdr.de>; Fri, 20 Jun 2025 09:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87FDA3BB3F5
	for <lists+linux-leds@lfdr.de>; Fri, 20 Jun 2025 07:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A05C231847;
	Fri, 20 Jun 2025 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="qG1xoaTk"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6875231854
	for <linux-leds@vger.kernel.org>; Fri, 20 Jun 2025 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406051; cv=none; b=SmIreU5rntRlYb5Z5jQ+O4VEmBjKwFHzKcLNmXKG05UYfLGiSnpbfIrDBnn7fNn1ttxgBMvMeL5Mmjo68/j8DOI5F+MpDLZdIXyeV6waCBaWDfjj6nMKte/a+070ONKWrLsawhF78EloOqnZA6+FCPMzAUzvZlLBUZD9ZV7hpGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406051; c=relaxed/simple;
	bh=3ho3xDcaUCZHu5x2wDuySzqJnCK6sTSub5SCyi8oj8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NaY1TTUOaSUyqqvEm5nkyWYfW+y7w66hN8aAnlMKx9jbLQWQmGgAicTjV5XFJAiNhx/1iLByThxAa3IYCf25mkXskfDK7F4hga64G7Svsid9aMGD0MxKYOCdt3mB20Uc9czUMJblU8h7fzKtqJ7P7/Zc+c1nxCnHrrJjyzAt1f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=qG1xoaTk; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7db6aaef22so1277640276.0
        for <linux-leds@vger.kernel.org>; Fri, 20 Jun 2025 00:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1750406048; x=1751010848; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3ho3xDcaUCZHu5x2wDuySzqJnCK6sTSub5SCyi8oj8A=;
        b=qG1xoaTkV+F4E85cnF/sr9rYkVgfXmULI5BL+ekeEOemhTTtBPV7Q2/9B1y0eB3ucU
         NCSqUeywTM6zclxffDa04QlnxB9l210YqZK3N0B1ZbJ6mwaFzxLpPOvnmhrCLeDpQ3Wf
         XSZIeBKHzVE1MybudkViDzkyMRjLODcnA4pjBtfeV3mh8AZSIVfwH2zQBAS65fE8C1hn
         nmIGEItVoE/PogJuRnwe+CFnwnPo+Ht7Askiql4GByczu+NvbDTOHeJbAYMWPnLqbB4G
         XAHS0ShGf5lM/PRjdsGOs71OkUF877JYinete6u0EDziNCU/qp4cHb9FRI2QM3UOvVvu
         tcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406048; x=1751010848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ho3xDcaUCZHu5x2wDuySzqJnCK6sTSub5SCyi8oj8A=;
        b=NRjtuL4E5cbEPkH7CIy6PboY4UDXD/5i3lRYUuSfwYATj3c53e+2a/CZS1/Y92eXfe
         RRqhy1wZO84V6dpxyLOQAgZQkVjhf+I7S2nd9l3dqvbL824i8SFtKK1o48sr1x6tM2kN
         UbDJGL9xXobDcwxUUInXGluTCbDxDT1q76E6RxQtPr05G3IpHRBfVpLfMlV0A4vCGvxj
         q262NpFp8dq0frNqTOq7adhtOZYjEuje0jZh10NEyvLO1St0krCC7ouqPH8Mi8xeJJPq
         PcmRCMaCx9/vvJdtYpzFWbHzSbyMKZtV9RG+Lv9cRjZFy+2QoFhvJCBOvu0V0//4pduJ
         AzEQ==
X-Gm-Message-State: AOJu0YxCbosmVLYKmAAjCWSzSSqZL6aQsUmP9mL5Z7Fq4Dt0+WatKyi1
	GTxv9AQCAK/KdIzJL0NtYQY16LdbZI54Y1AhMAQALBbT/hQVM8YisC/h4pNaBa4PJpMH4fSpJuy
	Z8IJopfE2G37MrGyr13cNk7mTCSeCVMnVkggyvd8yGRiqIQNHDcBy+b7k6w==
X-Gm-Gg: ASbGnctsTj2mcVvKrpeNUbEeyiEhRey1DpX7m7WAZWklLy8SZxil2N3JlZjTETDyQEP
	c+YF9BiVOXRBj0PdIH6uNtamMuc5t3W1HokiRa41rhLvudKEMZQnIe/uvVshJsS2SvGuI9MwbBt
	NREDX5n/ARY1+CpNqgZrX+7CObwsMW5rgHpNzawxF5EQEPjlVHkrT+oVFHdurazfhWwSkUMNNWq
	gwu4g==
X-Google-Smtp-Source: AGHT+IGY+zyqMHbAE/t2rOsupdyHbFUlX8tyOkrkBm++JuSBhacoXjOPLtaxm2bbESHlMs/2EFnZ9EDxX0lxsXxndUE=
X-Received: by 2002:a05:6902:1445:b0:e81:3a5b:b1a5 with SMTP id
 3f1490d57ef6-e842bcd5063mr2687308276.27.1750406048615; Fri, 20 Jun 2025
 00:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619142233.653273-1-pzalewski@thegoodpenguin.co.uk>
 <20250619142233.653273-2-pzalewski@thegoodpenguin.co.uk> <e032ea52-49e2-4bef-bb66-cf5a1cca6e26@kernel.org>
In-Reply-To: <e032ea52-49e2-4bef-bb66-cf5a1cca6e26@kernel.org>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 20 Jun 2025 08:53:57 +0100
X-Gm-Features: AX0GCFsO3JhCMpwOkPNFha5AIfnjFaxF1hnKF8yT-E-AJzL0u0wBIQSAx4efKdg
Message-ID: <CAA6zWZ+4s7wZQraXm+bj-re2NzDpewuSVgVsc_R1DaruA=Cf0w@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindigs: leds: is31fl32xx: add optional properties section
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Please kindly resend and include all necessary To/Cc entries.

Right on, thanks for pointing it out, forgot about that indeed, will do in v2.

> No new properties for TXT. Convert first to DT schema.

Noted.

> Also, there is no such thing as is31fl32xx company.

Noted.

> Eh, plus typo in subject prefix, it is dt-bindings. Please organize the
> patch documenting compatible (DT bindings) before their user.
> See also:
> https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Eh, you are right.

Kind regards,
Pawel

