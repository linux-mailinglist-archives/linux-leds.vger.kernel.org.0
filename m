Return-Path: <linux-leds+bounces-8845-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bc4oAWSGRmplXwsAu9opvQ
	(envelope-from <linux-leds+bounces-8845-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 17:40:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5786F9880
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 17:40:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=owyn69JM;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8845-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8845-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0498E30054C4
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 15:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDCE37A826;
	Thu,  2 Jul 2026 15:40:17 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8AD3191CE
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 15:40:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783006817; cv=pass; b=uI1k3ICRviFMrj6x4hnweS+xmj2vvXO3VA6n5t0bzw80tzGndge8ot8l49xXrR5GboG0cMiaDhMRigA7XfMEKFexzdE8wOnWx1dHEdXITHklmKu4vZBw7PPNqpueE+IiQaMp5CtgcOBT9Oaepj72tPRrT1agMauW/PWCJm2ikSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783006817; c=relaxed/simple;
	bh=iNinoTrCwBOfPghiG9xKszZ45U+jYGs9LkTKb4QIfns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kyklJGYPuu/3l+bet7Fgjfl0lNJTyNKiFeZZuRxibDMF6GIez5bbMmNjRGcssxNFb9kdtO3oCKRJv76/uRZLsNYl1in14rZASRNuRHCwT6dX6emONFPriqhfTZGZ6XKiDfxMfcwkedjLEdW61sYtINfCCaEHgzFEfSaMQPWfHAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=owyn69JM; arc=pass smtp.client-ip=74.125.224.50
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664d910cc75so2630097d50.1
        for <linux-leds@vger.kernel.org>; Thu, 02 Jul 2026 08:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783006815; cv=none;
        d=google.com; s=arc-20260327;
        b=JafmdwRIm63tO4/2FYU/mbBiI4yGzY5Hi4Uq0dGsBhmJBnSz2sCCyrudYAco6z1TTy
         kDm9yM1E1Fip0i2YLvTnvV7kifZCaUK9dDfEIpNOukVgS8QujmXV19ZjYRtu8Y96JQAE
         N67XY5GmHX5aZjjmhy4//7GjssGQIi0q0ljK/thOCsIYseNaNsn5ImGf8salWjCW/LbN
         iu6j78YPuOejF+4r3RhBM00seYEUb5w4wnTiG+Ce6MmzxGcHYss8sOzEQvKHIxk2DeST
         JyANNJaJnLKodVkgDus6I08EU8GxnyVZk2zKDRHekqaU2GZ6fPSvb/qKVTeIy5EXRfz/
         CWJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g09CPOiEjRdcq2MSHfeKmcvTW5xcwBZpYTF7uAPIEtE=;
        fh=7fjvjSFc3jap8PyCgJMxbnw2tIMiV+HEzsrIiwqcH38=;
        b=UkSUnOJ4wBL8/5SGTIgku1qLSZIv0/mqHignjlu+krgAZ8+l8oSL3kE6wpB6ZHeBFA
         HTPXxOlyqXWd/s7NHuJGfRw4dTS0bIVZDwYFhDS8P/GxSaaiyMt4wKEBRzGUNj3b1Kmo
         8s4aRGwLxq2Gfr2+6mkjO0FBWl4Hnj2+nr6+lQPHTiRaJuX7LzDMuNftZBVWJpRSKznR
         FJ2Ozy5Ho35qI/Ss7eKUC3HAccbro5oZd+VO1HYd/9R1AoLDp+bqWP9M87IWcvhJvJUm
         5QZyvlb3M5OW4FaGN7Q6YBf8aDf98khobbGtK3fsZTsD4/t29imiCwp9u00vh4HrAjkp
         hEKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783006815; x=1783611615; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g09CPOiEjRdcq2MSHfeKmcvTW5xcwBZpYTF7uAPIEtE=;
        b=owyn69JMgWIe33F2L6G0dfmipYqoD2ITP9aY0nbn49UJHkmw0+8uxcRl+G6hMl0xSn
         SrURKwgF2cRUCAEcxRwbmJEFpuBQdRuI7B1C3ovB+XzjMv15tZjzZo44KBpz5C/R4mD7
         EE9Izrzs64TxyEdFdxJXxGjkEv6M1lGU4EGBKvuerQ3NQ2Qr2vP+szp8Gm1XwERcgHH4
         TWEx7Pikis+fg3bn9o8SD2ZQdRNTDXV1zxIlj0RvVcPzv8gBg9FxzsT0csWGr/T6smi0
         TJqBwNWIJdcTXLBH1tcRbUxXj7hVDpA7CLiWv3N49w7EVv8VslKwLIwOZkXEzKJcEV2+
         RBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783006815; x=1783611615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g09CPOiEjRdcq2MSHfeKmcvTW5xcwBZpYTF7uAPIEtE=;
        b=e4rZY3g3zOfFHAJcLSiKNWWSx68gkj885F39yDronqp5ARqxRY228/Hxq9a83vSXGY
         xGbKuM2OYdv/7c6LbzGTV6QyPbJbZKySGcWBshZqjQ1/Md8+mO+1R78gfV1L2GXYdH+k
         HgH2RbmriJGCyqjNehooS8PLE1IWe+NpwN7ZynyEW9K8Lo8Ai1IhjcwOiXhlFj7BbZg1
         tzPFMoGwHFd0kB43AcV3MgTqvhhuOT/RrTJIN4Sgdn9y7F+n3Fc9rGbD7IQWqvwqYRV9
         +P5wGnV6hTLQJbqsDsNr1uFa6GCJaVXUmlMBWBYWCFRO9DpM+WpNxxmFc5sZS3jNkWv9
         Hv2A==
X-Forwarded-Encrypted: i=1; AHgh+RpWjDVmASKtEkn1azzoLgu9bJrrkKxNCHZ9T5zvPCs3DW8WgtJNFGeYhUJ0fEa3XC+QnMrwp59d706a@vger.kernel.org
X-Gm-Message-State: AOJu0YzbjMPHpyk5BkjD4DltB5ZC4U8xvnjY6VI21wQ2Hk7XRvQdfzLw
	2YiAtV3GRI0QqlDrn8FVBhBzb5eqBy9ijepNcJx3PobYS3T8zh6XWxYnn9wAdQJAUeUjc+PyPYL
	y0U9HU7k0OY4/UZsib/iYYcLzBMKJBLE=
X-Gm-Gg: AfdE7claiIO+Y/A2QSNoXW3KoPnWQpcRWlGvF5pwRb6o3unaVFbhplM1JD4OzuTVIHR
	lTmKxaXRhmF34JdcItU70Iyr2EC3nJgnHft40H6L6PRhoK1YgEBeptKKpkxGpVyp4sijCcZoDS8
	+CUl4xBaTati7F4Vzb8+Nea8uGw23cO4enb/nKWebFqjtX+VSn2OnqH1hOtqS5na61g/M1BMR7G
	dUMn6Blgh0gTw/ZuR9z2U6qq8T2NI7ihNpv4o3JZ3oWsrtpwJLGMoyYLqhxmbGL/QAVb2Uolioq
	in79z+c68dfojHKdZ1f1ctqpopQ=
X-Received: by 2002:a05:690e:dc8:b0:664:e8ac:21ce with SMTP id
 956f58d0204a3-665964e61ebmr5869169d50.24.1783006797047; Thu, 02 Jul 2026
 08:39:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619162113.416864-1-mertsftl@gmail.com> <20260702144917.GR2108533@google.com>
In-Reply-To: <20260702144917.GR2108533@google.com>
From: Mert Seftali <mertsftl@gmail.com>
Date: Thu, 2 Jul 2026 17:39:45 +0200
X-Gm-Features: AVVi8CdExbWLEvBCfGNhooVePIPil_ClyKDRJeEVzspcRHcseRGv_6iZ-6EaIdI
Message-ID: <CAA3NooqNH4Pu2EaiwOJOmDV5oQ9HNw1aAu_naXS75LL=EnmRzQ@mail.gmail.com>
Subject: Re: [PATCH] leds: pwm: Annotate leds[] with __counted_by()
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, linux-leds@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
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
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8845-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-leds@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B5786F9880

On Fri, 19 Jun 2026, Lee Jones wrote:
> Nit, why not keep the variable names the same rather than use the for
> iterator?  i's and j's are usually for throw-away variables, but this is
> counting something real.
>
> Or if you wanted to be even smarter, why not just pass the priv->leds[n]
> that you want to operate on and increment num_leds here instead?
> Less args == more better.

Sure, that's tidier, i'll do both. Passing the led_pwm_data element in
means led_pwm_add doesn't need priv or the index anymore, so it drops to
(dev, led_data, led, fwnode). And bumping num_leds in the loop means it
doubles as the index, so the throw-away i goes away too.

will prepare v2, thanks for the review!

Mert

