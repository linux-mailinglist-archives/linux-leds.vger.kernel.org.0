Return-Path: <linux-leds+bounces-8536-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pi4JD+LsJWokNwIAu9opvQ
	(envelope-from <linux-leds+bounces-8536-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 08 Jun 2026 00:12:50 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C3651CA1
	for <lists+linux-leds@lfdr.de>; Mon, 08 Jun 2026 00:12:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=c1D+7C9S;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8536-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8536-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39AD530010D2
	for <lists+linux-leds@lfdr.de>; Sun,  7 Jun 2026 22:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4520D3385B9;
	Sun,  7 Jun 2026 22:12:48 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3D46FC5
	for <linux-leds@vger.kernel.org>; Sun,  7 Jun 2026 22:12:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780870368; cv=pass; b=XTBEZx0PceMsLSNI4+Nix00/gw7VwOqlxfCpctQIF79laPq8KYyqE/gqAz/WxZEZ9Q2QW6xihH+ytGgooOU6kjbdfS9NcMwa2s8moku1TsQOqltfXoX28bElFvWCBLYTGvxF1jmhhqQMHjpCee5RMtO/jqvZbLXCWms/QPmrcVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780870368; c=relaxed/simple;
	bh=FLx17+5yV9ZaZdKvN7jW6CFKkO72yHItwIMTRjYfvYo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=DFMTVXtTMg65pQLaTA95e7s7oJ/nw3GhsbB0aDUZ+tMBsQ779swN1ifZEUnByXqwGNpc5L2QCQ9gPjIOivupi2jirXZbFcFl3QJWmNhhJR1vQFRbpYFPQE1X5/YywSS4qTL83XpC3Avzl1Y3lOt/NvSHN2pHPeGcqHseG4Z8jdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1D+7C9S; arc=pass smtp.client-ip=209.85.160.177
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-516e1525aa3so46058971cf.3
        for <linux-leds@vger.kernel.org>; Sun, 07 Jun 2026 15:12:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780870366; cv=none;
        d=google.com; s=arc-20240605;
        b=OoH+yE+Kd73t0z5VJZ+VxCYYnIOxkg0NwMAJ4ezQzPalW1q8Ju6bWNDqoR98Ewseco
         l+B6uGOpSwBtMfcEBYa0XHkWLIji05svn4LjQRY9gOFXld6FqubXYXxcKuAZ0A9DDdLZ
         jfit2QRYFW6cnSkBKc1TXoslCei+hmOna0VOU8tyHPpUB2rIUeIEZV774fKsIsslokSI
         AQBC7hmb82GZ80KlGESzh/YZv2gOHoFea055+8wxLcIyX+ZaLpWhwYFPJj7L5368AHC9
         NDeHKdJo8zRd0Ii2OYJMwqLR9GeqRdX+9Zlpoio6E4IWSmQTlHUfaro2R8t8uDdhOsQF
         Vhlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FLx17+5yV9ZaZdKvN7jW6CFKkO72yHItwIMTRjYfvYo=;
        fh=tdkwhW99jnOcyLUhvpXs9R5+bBdPNbyOdrB7VujRgfo=;
        b=DvoQnHy7Ket4qA2NZh003PN4dTqi8pGI+hk940EovD/oTHq9dC9CDF6zib8prQsw+5
         6DHe9jQ7vhtQr/Gs1BQBcDNTr9i0MEHaiO3M4xU20IzQKOyd0MnROlRzuAYcgfsSb3Pw
         OEK7st2mDKixVv4vaZcEwWM3tGax83uwHw9LvALETCJBgF5ETOF7PONmez7wsz77jW3F
         mT9zd52Nd+tQqZnEQhmDpVnKW0MiLW8vjRZpGyEUYFxSXm2Ay4Ty96iIB1rwE6jihtGS
         wvJZiRAkmp6QuZS140KKNJEn9xUHYVfDILX7DUJ4CB2heVKrOvvpns4AuPhSs/MvT2o8
         u+sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780870366; x=1781475166; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FLx17+5yV9ZaZdKvN7jW6CFKkO72yHItwIMTRjYfvYo=;
        b=c1D+7C9S7r4oTLYeNzCuxo3/SiytqKqRX9DE05d3h6epe1xBUfKzKOWLitvBXIN9Pq
         57bjGwnfY5cSj1JmnW+ErjutZCJnxa6chdhd3NcSFFJefKdUcWVekj3qWC7MMShq1Xh/
         stIjJ4NLmijsSY2cm0qlgtYLMqqRASZO7CY+Cy0YhhXvIWG728khlAKr2686VXiK2lRe
         D0MY9WlrOLqVZfH93bHvwazO/wetPpY4lOp8q/udTG+uJAr6yO0JZcOzSejy7uMTiB+w
         ybGDzlyPIws/SzLCb/3Apl87PVJtitoXR50rsN20td/ATHjlUt3z1ec313CurpuXT7ho
         6fiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780870366; x=1781475166;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FLx17+5yV9ZaZdKvN7jW6CFKkO72yHItwIMTRjYfvYo=;
        b=bJ8j4re2caWy9sbc1QEY7nivI90O2QtMt//lLR5hUINIcLxBzhDWOl4XUmG20ZqA5p
         BiK4j2kJchP/SiOg7bo39Basbp54AlrivaAsCA+xLEFM14dzlyr1FHUWBeCoU8bqDtc2
         SSOi9pFmP4yjQGfv5jltFB+/tBiiOUQtp/j4ZtrsRMDM5X2cwQxz+52IVBgrbdbh+bGb
         vEjCCm4RXZlwnu23BskJt6io5HtGHRfxaX6cd8o8sokJdq0ybb5oFDEHeDPHuNQrhXel
         dgbLjq1pRjKqifZ7r9XudWVsM94Yz8bJOg9sQD7EMzYdG6XPw1FbRKAzBWVWKhn0rS8y
         0yXA==
X-Gm-Message-State: AOJu0Yxz5WbrVhNU4fGaLjMvg13ya8X+bug46VvaYF1mxnxYi+N3ctTc
	b2FK8O+KQItQECD+u9EKtQ6/as6WeT6h3e6WXt9XIRsxa++16/rO397ImUAK2Aeuqm2BWys52pN
	svwIgV/II/YqBoj80irsH9LGiV2ZaehJStj+1gX8=
X-Gm-Gg: Acq92OEgGStUWvq2z69p3NKuHnAex4gqkZL1qU2uSchSbxmmBkHjIu3wtIjcapdfzHN
	lpINXs09ChU+toNgYbvT/vSykAmhV65lyGpg34pN4QqNVAjTrgLxkYhVJFlacVafoRh4eNylaTo
	oPMXNskLxt92AVhlSkfRNLbH6l/iFmr7RYpd9qE20lSKmBgNSrbDySf2gPUhLF3JIvuT1ad4ki7
	6jUBjIyvmKUsO0PaRDUL6d56+CjP2hiRHNFSbvOQEUKbXeZHYwMJeOgteyYl7sJNdi5p0Sbd+kb
	aDJ/oiiB8+7SdBTphwwLxQEr9BM8QBdX1MIFFqi3Q1X6GOUzGg==
X-Received: by 2002:ac8:5d0c:0:b0:516:dcfc:ebc3 with SMTP id
 d75a77b69052e-51795c52ac0mr194397281cf.30.1780870365823; Sun, 07 Jun 2026
 15:12:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Lorenzo Egidio <lorenzoegidioms@gmail.com>
Date: Sun, 7 Jun 2026 19:15:50 -0300
X-Gm-Features: AVVi8CdW_8mtNHUvl90y9Vz-bxN9FpD_WSDoFK3RONQipt9rx4r8wBxhZRwasJg
Message-ID: <CAFxreVHrZ_yxKGeP9YZkth7V+5n7ZuUA=7HMrumuyqCqFTazYQ@mail.gmail.com>
Subject: Possible problem with led_test_class_register() KUnit test
To: linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8536-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lorenzoegidioms@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lorenzoegidioms@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C25C3651CA1

Hello

File Location: drivers/leds/led-test.c

During my review of the KUnit LED framework tests I found a possible
bug in the led_test_class_register() function.

The test does successfully register cdev_clash:

ret = devm_led_classdev_register(dev, cdev_clash);
KUNIT_ASSERT_EQ(test, ret, 0);

and then tries to register the same struct led_classdev pointer again:

cdev_clash->flags |= LED_REJECT_NAME_CONFLICT; ret =
devm_led_classdev_register(dev, cdev_clash); KUNIT_EXPECT_EQ(test,
ret, -EEXIST);

It looks like this is meant to be testing the rejection due to a name
conflict but the object being registered is already registered at that
moment.

Therefore, the failure observed (if any) would be dictated by the
implementation of devm_led_classdev_register() when it comes to
re-registering an already registered led_classdev and not solely by
the test for name-conflict handling.

Why not just create another separate struct led_classdev instance for
the conflict test, something like:

cdev_conflict = devm_kmemdup(dev, cdev, sizeof(*cdev), GFP_KERNEL);
cdev_conflict->flags |= LED_REJECT_NAME_CONFLICT;

ret = devm_led_classdev_register(dev, cdev_conflict);

That way the name-conflict path is not mixed with any behavior related
re-registering an already registered LED class device.

Also, in led_test_class_add_lookup_and_get(), the struct
led_lookup_data lookup is not zero-initialized. It would be good
practice to initialize it with {} to avoid problems if the structure
is changed in the future.

Regards.

