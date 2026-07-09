Return-Path: <linux-leds+bounces-8994-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AyssMRmqT2pmmQIAu9opvQ
	(envelope-from <linux-leds+bounces-8994-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 16:03:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6E2731ED2
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 16:03:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RfqIgpwU;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8994-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8994-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD8D33046532
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jul 2026 14:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E02232E126;
	Thu,  9 Jul 2026 13:58:05 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACAC32D7FA
	for <linux-leds@vger.kernel.org>; Thu,  9 Jul 2026 13:58:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605485; cv=pass; b=QOc3tZaSlNbvEOyYPm1TLptQeKDnTqf20L2m8IAjgo+P+wmQqweVOq6LoVa2PzXS9WRf3Lk6M+iyln74sCw1hvAlnbqqBEwTryNQ/nh9DfDrTakcFoWGHt0QyoRSE006V1YR8VYEFoNJWw+l06sOIXaJgtDZWGOD6yCas7O+wLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605485; c=relaxed/simple;
	bh=r3iI4FQsX7ZhfhRt+a0Quj9D6BAbfUeo2lIKS5+h3ak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+OuVIbKIBM7W4gIXHf34qUSXLvk16uZ7xzYI769Jj/JSqwi229xv/AwRRPg/ZeEREeQs12Fih6+MbMVlNKB/KPUDbtg4kbjRSOc4CefL40K+oAi0/srazW/NmslsMP/bf1jPpXSB5tKgmOHg5NyBtuwb+T0vKamtRwHtvygWKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfqIgpwU; arc=pass smtp.client-ip=74.125.224.48
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6679d88abdcso2767256d50.2
        for <linux-leds@vger.kernel.org>; Thu, 09 Jul 2026 06:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783605483; cv=none;
        d=google.com; s=arc-20260327;
        b=f50kjXzLTGN2OC/90Jnld+joS9LNfWEQke7kyHozcRbz8c8kVxNri9uAcO05t1hUhX
         qvpJnRuzuquKBrGb5wUsUFzIQGB5R/tihPM39tgU/ut0cbneZXd/Eq970UpTeTNqmxU8
         1KStWxtNIgrCri1FVhNjH7fWBph7RkGc8Pz01nDCL8j3685qJwlYSYFYgKSdonPPAccA
         dPhXkbbWzB9w8xjtMJcYxw3urddoZ4VF1W4GPTcyBw75I2sxEWt27CjiI0mYFw+MSvY0
         Qn0tNFXwdtoaF2bC+TEnCSyr746RiSzkpHCDerA7fqkiwOWsmrUgfiAHa7Lyu7H7rZcJ
         uWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=r3iI4FQsX7ZhfhRt+a0Quj9D6BAbfUeo2lIKS5+h3ak=;
        fh=fWiIBwWMKvjluC67PbjrawlRbczpCLpYlYq2wEcL8xg=;
        b=exflMgqcD+3Vd9h6dSJiwOpO5FcRFgWmALFM4XcTKXLsXKliY/YbbbJkI+mWH0Pj3K
         l4Qcn9zpyVKxBMKihoQQYVPyHEG6HItjkk2xwU8GveUw0p32XYSCdUfMqgrZVInlc0hS
         JHUkIuipVaZT1+rzOrQi2Aw5nCYnI2IrVfuPnSW/71ympHeJmtpcT/w4k/5jdHZJrfho
         wix/gcrvc0FOcsRObq5YQ359j7GopOZeQGXz6myaSGh2OyTlPy7v3Ax0YwbLKKRervk3
         NqVBmNCBPFpQg3UJeP3opUtArgh7deVMcOnJweHotpo5vJoP7bhgSHD5euZUL2YAvAPF
         4v9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783605483; x=1784210283; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r3iI4FQsX7ZhfhRt+a0Quj9D6BAbfUeo2lIKS5+h3ak=;
        b=RfqIgpwUGyp+BPfn6hOfYfbOiQOYx0eb8NL5P7L8Ad/p8qwGEtzdVjDxb19jdgNb80
         BcPOkZ8ryXXrn5dX+dfVLRR/IF5hKEf7WzaR9bJbEVnpP4fXreLx9ErwLHVeaTmoNPQv
         o33t0e3YxIGw7s3pOS3PVzzdXx68X+i8xnDpLrmECBXZM9wfnrIDV4u8JlhWOKMO6jiJ
         yHMA7iDW1fdX8S10yzrIOrpd4RcSSfd+tNjCg0Y2m5orQphB629dimZ+Ylzd9iDbsKGp
         UsPLV/edXSQ8eF6H5zsmumrRMDWwbTSWwuH+m5VYft9gGfzoso9qP2ke9XuSgCMNHIuz
         JeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783605483; x=1784210283;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r3iI4FQsX7ZhfhRt+a0Quj9D6BAbfUeo2lIKS5+h3ak=;
        b=V/rWFb+goXVq/6cAzWZ4DiUgVuuHrmQN0Dgm3gb6rads5YR16Ij7gPR0y3cOeoy0Q/
         GJvOMAnaOCzkOucEszQaznEYmwOd0zDooImsKuXSr2TnzzdLOcC/xyflwdhQf5bSC9IS
         KXCfslymDOqyhgkvCT1Ebg9QmHDJX6lRPzKWqxKtic6E5EDceqKlDa7CQUg13ZxtfUc/
         oriQtI/xNV7uxuvEg7SfQn5Sm3gjLs5iEX6zXESLXduIk6ZQjITCsmnpakFfCo+wdsfq
         29gkEjmVaTJaNGEphjhhE+rsDAtEBztn7rjl/jKzzYGeZ7prg/anysLWq79wU11u7cE6
         FIIg==
X-Forwarded-Encrypted: i=1; AHgh+RpozU3xVBx+KmPK9KVvrDWcFNdaWGzLC4YhhArUrqJuN0wkIeepAoY3eEBqis1+ULUpN2BKCrNRKKdI@vger.kernel.org
X-Gm-Message-State: AOJu0YxsptbkitjVxuNwJTnPZN3HqXdpkF3WBdJvWxNXnxtdU3nf7UHj
	w33DrpY96IIBwiVpEzcgoHDhGDqVT7luca2v4N6i7Rcj/uUhmzFWEAnTQrZpUgTBA2xeFNdu3dU
	cjKL6cuFk84s9eXXW2CcL/c+xNQw1FTg=
X-Gm-Gg: AfdE7cm+hBU249LNdRv2o7s4F5RcHhD77Flr5FruKicallJdSkCKpFXe1hNiA3VQxvZ
	A+ai55dx5vCh+2my2NxDjdJ/LaxuatC/N5+9zANBo83S4Ethe7g4FFsi2OGPulWVpyYv4hHmjkK
	EspP6IQKm9dVEyDM0UaFBXQHTUF23JSsBCdgAHtXno/EYELhn10cyaIbfwqtxabTge28kzoGfVL
	JokC0E5TJuLfgGcHy7Ijtz9FmgJ1Sw9HMBx8stOPqpjPV4l3s7Qu6qO/V/qXHRn2LjORJa3fXNh
	mt5z1OnqtSnZyfMxKtTlmhLprNE=
X-Received: by 2002:a05:690e:4807:b0:667:770c:f88e with SMTP id
 956f58d0204a3-6679f1593e4mr3775472d50.45.1783605483239; Thu, 09 Jul 2026
 06:58:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702155452.67594-1-mertseftali@web.de> <20260702160459.9BC4E1F00A3A@smtp.kernel.org>
 <20260709091356.GA2045740@google.com>
In-Reply-To: <20260709091356.GA2045740@google.com>
From: Mert Seftali <mertsftl@gmail.com>
Date: Thu, 9 Jul 2026 15:57:51 +0200
X-Gm-Features: AVVi8Cf68ZmUY1hV863gHaHYCKH7BG0YX2eqC3s5GArbHueZriTKzMhUV2tA6TI
Message-ID: <CAA3Noorhmur5kPKwUP1_A3MmWoe=+JbekO6mP6cRy5XNunh_Bw@mail.gmail.com>
Subject: Re: [PATCH v2] leds: pwm: Annotate leds[] with __counted_by()
To: Lee Jones <lee@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8994-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:sashiko-reviews@lists.linux.dev,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE6E2731ED2

Hi Lee,

apologies for the wait. Been quite busy but will prepare the
remediation tomorrow
and send it straight away.

Thanks for your patience,
Mert

