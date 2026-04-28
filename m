Return-Path: <linux-leds+bounces-7895-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP6WOndH8WmBfgEAu9opvQ
	(envelope-from <linux-leds+bounces-7895-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 01:49:11 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9989748D80F
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 01:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBFF330C0CAE
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 23:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5093815C5;
	Tue, 28 Apr 2026 23:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqhu2+sG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6333624CB
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 23:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419355; cv=pass; b=jSlKGIRyOC5VPtK0nlpTRmtvkojZvwH5u3MJpLB2xRbUc0G3md7HYfDdDO2h/BEXZeZsupmXyPE8cH7o0TxJxm+Zo9eGVmIw82got8Rl0KI2x4xS6+W+zZDtNU68yRoOpB2C8bdiuVeELSJBLrt7D43uh6NLCfsSfuib+XhANNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419355; c=relaxed/simple;
	bh=p24DGe2ChYsLvCmBXf6Kp5TWFFLOr7i+/3Xsm2m1l9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VinKe5e3Tvs0Vzp7qomozAOVuokyUTE1WTx33Vdsnw2jpbUGEk9IrzI/OgYkpUgVFY1i62L77BTDk79keAILUYm+hsOz/EEYU4APXtrpbAxl8WoTuQeYaiVn/iC8aEVjqmZ1kNQpHNVm9Eiz2aJ6NrpXHxqAthimpda3JJzv2yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqhu2+sG; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so65870115ad.3
        for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 16:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777419354; cv=none;
        d=google.com; s=arc-20240605;
        b=ZzczMPrc5c4g6GhJzEk0wFOGYd6Sibxa7rtMR290WJMARzQnCtFDV24ky1/03ANHM0
         kx8lJia68Mmxp3ZUM53MCC1ekhr9PVhNGH8OSRW4ufO9+ykXLrxcNhr4Y4GqbVcuNLW2
         GNIt+K5YRv3K0CJ8ynka4Z9coaQa+1U97pXfCyfPdotDiKOaR3O5xps6SzAyF4NdnQY3
         ICqccNTyGZC8Ncy775yU5Ar1l9Bs2Y3+wG2nAfIQFHVY2S3eaN7d7Yl240IjnE0Dexg+
         JuRRadI3/N86jqYKLQdKC4PsypsGjedMvx5/ls9VbmKe1LM6YSh3C7pwkFDpt9gLGx76
         7WPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0db33wYSB/VKxNPenizKPNWOjqB/3saiIIrw++PQlmA=;
        fh=94XbC3KTtOt36R1PqUj8bQQHMWFQJmXEWoJmS904GCs=;
        b=V1sFuZOGJOuTv3xAjWb4fc3KyxfOgOKuwpW48kJe+0WunRcXSyp7ofjb4ZIeckS1no
         hQJ7QbRxBzjaCgqEutNItDS5MI4eiU5cLRDyUsuGZ19bYGNyb5yehTBrHFmI6482ePRF
         fNfv5CBWl0F5DPEeoCQmhIngHYx+0iGvAYKjyhRjHJjoxtqpnK2oPUy6caU9M6R9LOre
         PuR5ZaL2udrznYxGb/DSgb73WIYpmSbLkrcO14nqgFmSCsalrmD3g65BFuj828Stj/8K
         dJy7klORYn5+P4zLTKQrCMENyIEAUVUo2CXb0EgB+MyCQg/WahTiMBQYKTJyG6U91A+Q
         UOvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777419354; x=1778024154; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0db33wYSB/VKxNPenizKPNWOjqB/3saiIIrw++PQlmA=;
        b=lqhu2+sGzhBTsyZRRos2jZ387BvKCfAcc1fKf1A/JtGEisIHLLncDhhkhhRlvdUIMJ
         Dlg3Jve5tuMahEqtI8RpjhflyeAMzsEIi3hfFO6jBbs2PLnQBwAKxE8w8h5rWhIu/b7h
         i+1ggRanMO3AgRtgI6tcLrx4Anl5NaM4VL1nKJ7UaCeVYW34Bh8SvOqkrjGoFf+B4m3z
         XwhrlcC7MepsVB3dW4Sa6QjGUZJZW5ERxk8/PwiX1ZKWInGa07LASTJi254vjO4TYUf8
         KsgPXB1etH51a2Ky1hoCINE5EHN+oYpO5Ep8rRjv2b9Dl1aRPtQdeWinaMksZwxTenym
         bY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419354; x=1778024154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0db33wYSB/VKxNPenizKPNWOjqB/3saiIIrw++PQlmA=;
        b=brFzNf6uOR3Y7B5umE0sGWpD37S+dvKaac/kI+akAxUEpj5eJGE2XOcfbA4f8aUXxU
         RqizH9JPs68BHyFp6WCSciJ8qILH0zS6LCSk0dW7DdLVjUdPaadmGD5iHm8cdUfn+vOA
         9nV0dEzpu+tku24lKW3eE4b1SB9LioNfWCzDuXgosrXE2+6Lg3hB7dCx7IiAmLOgwW33
         OXgD6Xvfdx9q1Z25OQ959wub3nxz4eHnJuoA8Ssf7OQGfUCvQHalae1x28LE9LZS6mTK
         c7atBmxvaR1CQYBdIL/PJFFSjN7JN3gh5VnkE3KHk94p1w1iALBbGWjo80tST6YtVnOa
         1otQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EIbnnt1ipaqcNgCL73vbVTXW+bd1QfpZWo+bFP8s8aWkfVSOQJvPEp6okSmF1DieJgMfB/w57nUau@vger.kernel.org
X-Gm-Message-State: AOJu0YzQX8vXRlFYwA1REv1l/FyVYw65gmUfFaRa7buC8G5wv/ZQwWAS
	+0ptx6HlMKt7UZiogkt1KX5nvax49D8oy0GnmeBVY69xrhh8VNTZ8daN90LYr6fHhZZ/8rmojOP
	4BoNKZBLmuJXL4fX/OYTIzZKPad6irK8=
X-Gm-Gg: AeBDievZZcKBpxbTAJj41lzLL1lTvEEL3D9/Z3iyFO7ACwis2l97GpR8ZXNHJqhlrD8
	uRrsMn2CfSCY3YOcycm6DvNss9yJZGbHa5aumpL4jDgslU0O1vxX+8in1Nm6Hrf3y1JmwR0+zzH
	NW8FFtJwMdm2/cc3/vZBuhvKY6bigEaSvBJTplmu/33rU9Gq9zzaFJ14Z9B8oBFsBWThDCpVft2
	cMm3W4cBDuRwUzeDHfJRKf5pNl9DnAWo4UdoSQmcVn0pdkO3ed9/ZZ4quLtHbvZ20KjWuDw9014
	HhS002jZmArv/jvHI2WVv1YAhN3olN1LFQF4ayPCJMo9tgNzxhQ=
X-Received: by 2002:a17:903:1c5:b0:2b2:4b4e:e4d8 with SMTP id
 d9443c01a7336-2b98730ca87mr13536075ad.4.1777419353607; Tue, 28 Apr 2026
 16:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-0-0caade5fdb32@linaro.org>
 <20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-2-0caade5fdb32@linaro.org>
In-Reply-To: <20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-2-0caade5fdb32@linaro.org>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Wed, 29 Apr 2026 08:35:41 +0900
X-Gm-Features: AVHnY4IUG0aEhSqiUeS0javv0LFZ7gitoer-tm54oLakxbwVeIPwDa7HUcbCYTI
Message-ID: <CAKbEznvPAYFUt-ykH7rCQwMFUq6N68B9x7Dd97WRDm3Mvj34fw@mail.gmail.com>
Subject: Re: [PATCH 2/2] backlight: Add SY7758 6-channel High Efficiency LED
 Driver support
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 9989748D80F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7895-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gye976@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org,outlook.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi,

> +
> +static int sy7758_probe(struct i2c_client *client)
> +{

> +
> +       /* try read and check device id */
> +       ret = regmap_read(sydev->regmap, REG_DEV_ID, &dev_id);
> +       if (ret < 0)
> +               return dev_err_probe(dev, -EPROBE_DEFER,
> +                                    "failed to read device id\n");

regmap_read() seems it can return errors other than -EPROBE_DEFER
(like -EINVAL,), and hardcoding -EPROBE_DEFER here might drop the
actual error.
And maybe would keep retrying probe forever

How about this?
> +               return dev_err_probe(dev, ret, "failed to read device id\n");


-- 
Thanks,
Gyeyoung

