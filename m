Return-Path: <linux-leds+bounces-8999-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mm+GND+0UGrU3gIAu9opvQ
	(envelope-from <linux-leds+bounces-8999-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 10:58:39 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 477E0738BC2
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 10:58:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=i1W09ECd;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8999-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8999-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43D893061978
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 08:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197C43BB690;
	Fri, 10 Jul 2026 08:53:29 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE39D3A8FEE
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 08:53:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673609; cv=pass; b=lWN51Xk5/5OlC7/flfo5dc4sRMKsHeRFJpudR4CMN0h9lbRd2o6QosL2uCEdJdwUh/jYh7A2f4Ra8Iv3waO7unanXdNBVHFFJJIa6Hz2AXFQNiUOlhgdb4teAXu6SrP1MSv9ppwewOLcTydIp3r/QwtXK3w5D6qAa/gsjLdawmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673609; c=relaxed/simple;
	bh=rrokNO663AJnxfbZn2qeXq7kp5aHBWHkKGU/gi9NuAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhUoAVh9lXUj/JGt69qABds05y2U4da1jAiDiTh52OvzhsDSCyH45DHbUFQtoY4W6/OqxVbZsRYzdP3gdxzCWUNK7emT+h0yr3eWB8DgGa7tyhqhcFVmf+aRdaFQntX8YlF9vzsbcpIA0+hahfiImL6kPg5xKM+yaaztmMszIu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1W09ECd; arc=pass smtp.client-ip=209.85.128.177
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81e83f1f15aso4305707b3.1
        for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 01:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783673607; cv=none;
        d=google.com; s=arc-20260327;
        b=XnOUTQX1Hlc6FES5Xf505lbLENpHZVdYrGQAdAY0ZcZ0/zeS5E3fKRmHLMpySbKyd4
         wDKar8/Y/D6VJMFzq/NQu4R9cEELt5Gi+IAG1PwFSeErSLzerHd1bj0BLjZbY19xa3fM
         0VbN4ZEYCJ+3SwMJqJYuXBJx3sFZgEg4y+YRoEp8E+hdmWyqAmc36okheC2IuwTnHRO7
         Wgk+Be98238kdMJLAGRz3KJegQDRQ5JtyqdDfO4cQQpChYgMuhI6ISucJZ6nwheKEQ1V
         TyfFQWeRw9CrzELCFZul57XeAgwKyx5bfoCCEmHQTku//k8sGsz0rOHNcT040/kprYpr
         uPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rrokNO663AJnxfbZn2qeXq7kp5aHBWHkKGU/gi9NuAY=;
        fh=MCaENTl9BlB2fqUkNN17oXKvWMjmXNXQ8FUzdJR+u/k=;
        b=bsbcUrUnYQZzvx4TJAAsTZAPm6GAn+DGCDMKxmfoxb4FBTZU4C1iUHxYCIj02tVwtu
         wUxJcxpHyCLWhz3b05+/Y3QSWcPmo67Ae2jy6h1JZy0pBwdakvDTE1iLAbFgNgBSCTs9
         6OXUsAXeRDHXx11+D9paYM1YuaI16J6qmlAR8zDZxPGbX0e2Fj3xoS0YtLcTZGUw983k
         TGhiwGAdMVCNLzTWrbWt1PY7ojx76yc7N6oPjU9xZ1eb1Ne/Mc/cz1qMADhCaDoipaMU
         0hAq1eYRYJnDY2ED8VLk0cw/BCk/3qhVxapZEsMUMDnGcmY/HG/tEIoKjhMctM4jAFyH
         Nv6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783673607; x=1784278407; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrokNO663AJnxfbZn2qeXq7kp5aHBWHkKGU/gi9NuAY=;
        b=i1W09ECdibGs0sdppQpu1OB2dWZtqq0CNzQ3a3I4Kw0hWczMjIP6wZuLthrrZld5Fc
         5h03GR3WJCJYA0tUPi+S9SOzzOlW4bGzu1ODEtjFIQG96W0MZ19ANYaHhpOlQDDLm2y7
         41Aa3LwZrWwj63de7wWE27jH8N7MJ5QviwxdNhH6+JCpWp2SGhxvs37Q7/qBcl3OP7ci
         feSryqeaWtJ6G/Q94GjJT4UPzhgxJq45ZFNghWoNhsVjYBIVTZ2QgO2uIBMY73mMgZrX
         IK5ewL2rytMEkBy3quXJAZA90lwXP6aft3DD/aqayW+OOqSArvFW3syOdQpiJStjGmIp
         Vo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783673607; x=1784278407;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rrokNO663AJnxfbZn2qeXq7kp5aHBWHkKGU/gi9NuAY=;
        b=ojyy4TavSuCxEGteE2CUurzJoZDXAFWKxk4sUkofbu5jwdFWWERpMkB/bMWuBH0dpS
         z1FJ1xRKZjF75ryenrqyfsj7UJ4hwUS9Vjpw9h4etAxmQnSgTG8yUcf1/YQiFpeccJ8B
         DeMeCaGZjypRrPm9eY/ubqJwzRD3FvuC9BSTMjwesUX7gDC22LUbTXx7yKZS2zSDVgrn
         ofASlq+72uRGabtwY7vhFqj9/nSdtjZx2jekQoiDKFbtGj2Aoe41vCSctkK1qrYtlm6h
         GLlDHd8oJ9SPOYW/CiWgSHrwLVO1yWZDgCFQzDWMmN3Y2KIi03F4W0Hk1NfiLUcqqu+R
         yWPg==
X-Forwarded-Encrypted: i=1; AHgh+RqR5/9b7rkZnrRYR27EhWeqyrtxGwJUbC53mQzrqA34N9TeV8xWZb6xXpECVi3Cct/jZlOt72QCxqyk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz98tNAVSD0oiWGjpMujEoyPuGY6Sbwx61Hyo7IEC/195TQ9eHF
	VvbU3fOmPqq48uyuksB59JVF8JW0Q5R2osKmyxZP73xDJ1U40oS4kER/jVrWTke8Hgaow1nfpqB
	mYpEgiQqt2hMk6gSbRpPzJRZcubbm8z8=
X-Gm-Gg: AfdE7cnA28XMwenmNT8LzDVEJnQo3ZJ15wfhaVImgNqAZhXG4RRQ75yWGP9pQDh5I2s
	StslAxHF7JoJwZO+UHHng7Q9pKkMjnLPActLHDyykZbpnB5nOWHxQdeRsSU3I9vf6yT4ttLp8zh
	smumOlPQ9xLjPFsI+/SYn0Hwd0bKw7A7X5KJSNaCNlyY7vVkDjJw7HUVTr4hzKeord1jDszs6KQ
	47nQ7EMBQr53vafbVOsdXmo+1qy93paGoXsqJcV6enehFGeT1jfhoM+Zuuiwp83oCoezintUsIl
	y2BS1R4HRoyRCGpuXICgv+LoWVk=
X-Received: by 2002:a05:690c:6603:b0:7de:8229:e86e with SMTP id
 00721157ae682-81e7bc535bamr22632267b3.21.1783673606816; Fri, 10 Jul 2026
 01:53:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710070141.37214-1-mertsftl@gmail.com> <20260710071132.2AAB91F000E9@smtp.kernel.org>
In-Reply-To: <20260710071132.2AAB91F000E9@smtp.kernel.org>
From: Mert Seftali <mertsftl@gmail.com>
Date: Fri, 10 Jul 2026 10:53:15 +0200
X-Gm-Features: AVVi8Cfl_h5TZSnM2_kzmR_MbRt3H9iKsVECORQF8uRQGYJAwZpkIFrbi79ng6I
Message-ID: <CAA3Noor8kEMPbjAOf8UWz4LQ=n9H80=1L42wseOGH-3HGa7-XA@mail.gmail.com>
Subject: Re: [PATCH v3] leds: pwm: Annotate leds[] with __counted_by()
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8999-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 477E0738BC2

Hi Lee,

Sashiko is right and I tested it too now to confirm. Under UBSAN_BOUNDS
&priv->leds[i] traps on an out-of-range index, but the led_data++ walk
in v3 does not: decaying the array to a plain led_pwm_data * drops the
__counted_by association, so num_leds is only enforced on subscript
accesses and v3 has none.

Getting the check back means &priv->leds[i] subscripting. I can still
pass that element into led_pwm_add() as you suggested, it just brings a
loop index back. So it is a tradeoff: the cleaner pointer form, or the
annotation actually enforced.

Since the element-passing was your suggestion, which would you prefer:
keep the pointer walk (annotation stays documentary), or respin with
subscripting so num_leds is enforced? Happy to do either.

Thanks,
Mert

