Return-Path: <linux-leds+bounces-7507-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MBYNfnMxGnb3wQAu9opvQ
	(envelope-from <linux-leds+bounces-7507-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 07:06:49 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EFE32F924
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 07:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9C703046071
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 06:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5AF3AE6E1;
	Thu, 26 Mar 2026 06:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBvfFiws"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D723ACA7B
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 06:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774505112; cv=none; b=Q5k/hRYWQgaiW/nPDzw1cz0A4UO3ZXa2HCr5PB/qJ7kvht7CmM20kRhOxYixmx0GDTjo9K14P83fdPItuXihk6hq/V4i1NQqC26lrrdVvSIk0I8/vDv+BleJZUi0R6tJNd/EmnZ6hC6zPOcpYDX9MOdjjoM/ZPumF+jdX6hKCWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774505112; c=relaxed/simple;
	bh=qNFpsTzbZWFFsE9iGPhAqreCH10Wgsp1S3A+JKsN4UE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHiJyuCqUUbNg63b3GQVT4AxXzw3qH7z5dNqhM3P+jCstir5Wb86v3SQSmLptwYkYZVjHRe5GNdzXJxoi0Es1ag2NoZnfwdZNlq/vl+EPa24APX1F4cIqS820/E8SKpoLtG23fAgBaC3hGEtuBFUy/+v3dWMHqUCQNy2nX2M/Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBvfFiws; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b0abdde280so5917645ad.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 23:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774505111; x=1775109911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slX6PVa4cy3hgS68Dza9/DJkjU5Sh4E3O/3Ms43H/6g=;
        b=gBvfFiws1D7nrr0969LU2ttOkRDtgN0BXXAg7NjMb1jnWTiv7SwpdNrVptgI4QHkeh
         fgXQGXYgQVfLMCCRhsLdAiuvxtTmShQcFv4+owmBUkMnsEGItbmc/mkaquLahDJRLVxr
         dtoMNXsr2B0gDHbUDBbfUDN0mpW1+EbSMOwz0IPY4uxEoOT6VfbhS2r2Q2oP5QuTjy/d
         mwCqrhgFCg/bEpBlYpQqBqIQodsTnZk26HO+gvj4rpKqSanmg8wWJI0Dm9xL0I+hnkEd
         VL2NVdMiPuNiK87ljI1RcbEaJLQP9eBZf8G1Ly5ndrbLtjw0cEY8D9fwsXlwrGHEF861
         atnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774505111; x=1775109911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slX6PVa4cy3hgS68Dza9/DJkjU5Sh4E3O/3Ms43H/6g=;
        b=idwYEVNjec+I7DecddFXkSmJvtS2WrSIsbdeL/mEFRnIabskd9Phbkf4B4ZifIFNoE
         0k63JglJRIPBn+0eMGqKZI0mUs39LQQIxFXcI21h4H53cvctAx5tVFmwEktRbpZDkv2y
         +fdU3TRxnC0aXmcLtSZj7JUh7+5Mj9mzNB8QvZ7/jDFEKKcc7Td3IRgobhxWu0JsmVel
         q5Y7l93SszYV8dPuL98MkghCZ4iH+W/vdmsovSogC79snzHvHDnFTtb4RF00RywjDMRb
         a15ag2BEQjfHBkaZZoxjjZEBIknA9g6uH+Etz1TGBYw9gTgTJ86EE06UGeWGPxBAleP+
         Fp4w==
X-Forwarded-Encrypted: i=1; AJvYcCWFFh1R0R8+reiHIo8VEWijq+jZ6OjbpbW8kNh8VjWWZgc1OeP1BGGzjZRFsg9OQevkvjP9OvFeFTSU@vger.kernel.org
X-Gm-Message-State: AOJu0YxLk2fbiBhq+gYjiHzG/9UyxDo9nXkjVxqOCTOVPWZelrERVWQ3
	nuzXPwlemupuUoCzWfHTnpbxVimRMfwmjvHcNgumPz1UVxjtOYAK8CLm
X-Gm-Gg: ATEYQzzMZSsHlEO2mLX7D2ZPz9P7w65yRVvh68Pfgv9D992fP4PsiJcaZKiSTu/Z4rV
	Q3IjC9r4IYCsFdlcv0PbwJ20xZU96UWFTyBe3oEkBSZ+mVKZV05C/1U/4RBN+eS0MWBv/TaNFOA
	iFlLWVue+z/QrgIJw5lRyqqPg27L2AuhbId0TqSZX1uXsINE7DRVGp3iLY0NMDflqWfoyIoAoab
	h0O0kIFjs4N/ieN42EQ05nWFOc1Y+6RQpHeFUWhFTWBwDLmFPTRXUw8hln5v7PWn1c6kJ+RnQHg
	iLD0G308JN4AJI1UUh4z0G6fpIbKDLXt+kdbJt78GBcVQlGgYj4EUVRpzCybVjoocfQTl3fIKuM
	Auu5rWv7QDoVKdsTnQPaPDeHskNYPCS28WsKm1C457Y6yHGS5HGyOUVr4dslNRk0ISqsHdq8MvI
	8i+3WfTiJOMVBb0Zvygbik
X-Received: by 2002:a17:903:2f4f:b0:2b0:41eb:165e with SMTP id d9443c01a7336-2b0b0ac5e1cmr75649075ad.38.1774505110564;
        Wed, 25 Mar 2026 23:05:10 -0700 (PDT)
Received: from ArchLinux ([43.226.30.138])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc7afad1sm21051385ad.31.2026.03.25.23.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 23:05:10 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Sean Young <sean@mess.org>
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in xiaomi-ginkgo
Date: Thu, 26 Mar 2026 06:03:58 +0000
Message-ID: <20260326060402.16021-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <acRdOmHKQmBp-RSd@gofer.mess.org>
References: 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,somainline.org,vger.kernel.org,lists.sr.ht,intel.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-7507-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mess.org:email]
X-Rspamd-Queue-Id: 78EFE32F924
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 22:10:02 +0000 Sean Young <sean@mess.org> wrote:

> On Wed, Mar 25, 2026 at 06:07:23PM +0000, Biswapriyo Nath wrote:
> > This patch series add support for various components in Xiaomi Redmi
> > Note 8.
> > 
> > Most notably:
> > - IR transmitter
> 
> For the IR stuff:
> 
> Signed-off-by: Sean Young <sean@mess.org>

Hi, thank you for the review. Could you please add the trailer to the
specific patch. Otherwise, b4 adds the trailer to all patches. Also,
do you mean Reviewed-by or Acked-by tag instead of SoB?

Thanks.

