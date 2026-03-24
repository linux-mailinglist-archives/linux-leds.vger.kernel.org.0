Return-Path: <linux-leds+bounces-7460-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO/VELFVwmnNbgQAu9opvQ
	(envelope-from <linux-leds+bounces-7460-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 10:13:21 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 961B1305658
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 10:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 526FE30D6F81
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 09:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6EEC3DA7F1;
	Tue, 24 Mar 2026 09:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eobWxcRq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pdcz4TQ2"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC6E3D9DD5
	for <linux-leds@vger.kernel.org>; Tue, 24 Mar 2026 09:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343075; cv=none; b=gzsZ+ydIynxdkeHJzu4cogLIKvg49QevBefv2F5PeJ1So86JdnElUpIY7V/T7vNA5Ox+HE+nT01oFYdakwuvlnjZs0olMknjDyZ6wYovB0fmH6YdWvoCUH+eAc/zuic4VLeoQhBCFPSnHTmgDhzLjZUJLG/CqUlrrJKRMKNZ3AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343075; c=relaxed/simple;
	bh=jsWgh1Ti4adaFW3/HADaqw2MCIKnBpjGviAHd/Q/Jb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kjSnZvp/J05cUi1b7Js5wDfD8lxf8JnKJ4/1R2V7OzCKnJDupuXZ7+PldgpPFVSMLY+7hvWNhr0tnJHbqc+giT+jPvRHj2fNdzBq3FR7ZP4TCkmIxx8okzwv8v6rCCliLU2wC2MbTiqzeKllOEQomRXa1JflVT2DJ3VjY9tFu0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eobWxcRq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pdcz4TQ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O39S5a3934869
	for <linux-leds@vger.kernel.org>; Tue, 24 Mar 2026 09:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WPfigo46/ROFQ4N/tJ88i4ZYjoNiquVe9blKzLVTqFw=; b=eobWxcRqzLnx6L7E
	Sf1sa9GOx1ymukjiv7nmvyorMZyFEEEIWs5RIwb9MhQ6f2z/otzZBsq8jJkDb1uN
	rVybLrcZFmWgBaVQEKfGaGdmCjqIkTL/rfzcAy60xjCyyad/DpMXyVq6ZdoG+0Ia
	wEQMp0mCSpTNigow6FiwQ4SnRpux5RaoBsg3nhVrZjRIxswYoMCF30A9N/gR2UrV
	nNnicvThy2P2BYx3zvbu6YRcY63WHOOlQBb48RRhCsPT5JbQaRR0lW1OF6ZzCZE5
	rnqUWAbSs+lrAlApu0Io40IGtc6+u0BehQY9LiRi21gOw2zrXLE0Ym/0KUY5enIi
	Bxz+2Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0kmau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Tue, 24 Mar 2026 09:04:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090bc4823cso226873151cf.3
        for <linux-leds@vger.kernel.org>; Tue, 24 Mar 2026 02:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774343068; x=1774947868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPfigo46/ROFQ4N/tJ88i4ZYjoNiquVe9blKzLVTqFw=;
        b=Pdcz4TQ2A8JQo+sQADgNLJlPzAqPdNE1x5+fvHArq4z4q3KEqF8naQR+hesVMHlhqg
         9XU7GmhdSBLMg4ISD7t1slg3D6kGELGeUpoHfC7mGjCEsh72ICQ8u/TGJ7l2gv/MWeLL
         pTACFBAAZztElujiZIwbztD0phsFJ680zXxULpg9u0xpazpokwbIOusQidvRo3Gj+9GX
         GMaXJZgDMA7jIHNTx6yJ8U4sufoaYeLhi1GOMegbgq+1MF6evk5e5kQsYw3uJwesmiGd
         rOjyeMCUn3A2TLPcNR+xqpGNL3qepEXtJrgw9uoQ7wtQp+/mYuzwvJnZnhmrFqiJSidn
         ovbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774343068; x=1774947868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WPfigo46/ROFQ4N/tJ88i4ZYjoNiquVe9blKzLVTqFw=;
        b=m3WDeIXJ6EWLsKBNWFrwZxyULUEscx7NmETKFBza06SZjCkk87Yd2FCGDkUhL4THV6
         q6cSdT+t/waY8q1/mmM8kfmfLW/xNzgb+5JtUuYKj/4T/aBjpPq0N+gX/q3TO18ztGPq
         dBa8JB1J2pS0SQ8/3jhgHJVEttZl8xjoTuy1J587fHgVYMMGeDRjqUL+7p6hP9QRB+/8
         UEDE74gGXZoFr5ENj15meHvmRNhe8EoD2mQpUb+K2VuaKCX9PDQ9EsBkmD4FAplL0T3H
         WVH6vHTWu4oz+fCzws9jpuBVzoTHcFxnA9JOof6NHSLYiecVjMkbhJkpIMRQXeFj4xUV
         PpXw==
X-Forwarded-Encrypted: i=1; AJvYcCWIPdytIYMKXsbegCqG139J8dh60k6nrK+Ki6tSU+dzrXJT67LKClF6vAUSEOJMGcNbJo51L0EtHEtL@vger.kernel.org
X-Gm-Message-State: AOJu0YzAX2PRQDCExhTkga0DRZE80oDXx4fj3YVgC6QYLD4gTe5a2KsD
	GUnARcewVhj5g/1xo30HVPuEFsocSxqIzIEhQO1BMLFFm0ql0PrnL4JCvtMjhbeZCenr07qYaMk
	Pkn7iLtVQMgHPL2tiIM94URSJnpKkfQlNiC/FhV1dA29R7xls6YAhUUYLQ2tNUVEH
X-Gm-Gg: ATEYQzwUXbV4s6QIhaem8+ourQ+9MElqL2PO2RxEJ6N2emgPdHAP8Q62/hAdOKcBPy2
	cMV4bjZ0InCfKepckMH4q3xJTkd+A0bsUzEzx3/WkNMXye9nKSCJ5/Xu3uONKrlMLiDKJqHqFKw
	AujbJBJV0U9+BYpRRAakrlH3qYaVcRLlezuSSqlfbRig4n0OgAYTmfRhtVxs5EeoRs+qTy3OsPJ
	Xb48ktXnr44PXqflVHC+01DZWFKB6LYbmI+Pp0a2rl5DC7viKVHftR0difteazgBFXXwv7KRKkn
	XxFrebx9dMFTIzuZ2qkesR3BXdGi3lgFL5nw28Dz8e7nRjiWKH/zHNhVtnwJp+TkzAtl1VIwZG5
	nSB2IXSMiCCzLFGr8M7cuqd6+V2h7l5z8RqlcekSSbZJhw0h6maI=
X-Received: by 2002:a05:622a:154:b0:50b:51e9:2e8b with SMTP id d75a77b69052e-50b51e9310emr133853281cf.11.1774343067834;
        Tue, 24 Mar 2026 02:04:27 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:50b:51e9:2e8b with SMTP id d75a77b69052e-50b51e9310emr133852721cf.11.1774343067138;
        Tue, 24 Mar 2026 02:04:27 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:99ae:5c2c:ddf7:d77a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c086dsm40007565e9.8.2026.03.24.02.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 02:04:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linusw@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/9] gpio: remove uneeded Kconfig dependencies on OF_GPIO
Date: Tue, 24 Mar 2026 10:04:24 +0100
Message-ID: <177434305814.8385.4412622204610388581.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
References: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c2539c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_HlkyUIfcI8kue4dcD0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3MSBTYWx0ZWRfX70DFgSJ+cCE3
 k93nLXxE3esOqe6Fy9s7hvv4zE4y7hjX7suf9oDXkL2KFa3DJ51OO1X7IGP4EyZHTnIY3iGXAuU
 09KEMwJVSPxLJPswW3C0gwRIE7azlBEpH1JY46hlBIz8bD8VkI6vel+tM7bMhJkG9dATZciDfzF
 ZJ5UK9Q2kwMuRIiig7WVJBhO3UyqBaTotlEMq5iyrUW1Hu8+Qg5ZaQFtA9cc8tDhtkkx9ZMqz6B
 6u+ktRh3ye74ee4vdu+vJLeRJyF6H4XImnmkoPd1tM7vsKyMAf+CoHelBDGQBNBbD+18VyFkdFP
 8fIaYLS5wEtwkSpu0xNsLhqZuU2D/1WAo7+iYcchMWTEYH9TrMuPzjmRIXj7LKEj2ALhpJh2tas
 4SDR6w45Y4Nu95cXr2THw0LOaYVgXiUvvqIi9k4Vknk7iQBLWc4NFcZQB/ajL4ApIeLGvgD/hpA
 m5/XbMrYDuolFWhchIg==
X-Proofpoint-GUID: 8UQd2XHTwuuZFDP_ESFhuwj65sfVrtjx
X-Proofpoint-ORIG-GUID: 8UQd2XHTwuuZFDP_ESFhuwj65sfVrtjx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240071
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7460-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,redhat.com,linux-watchdog.org,roeck-us.net,linuxfoundation.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 961B1305658
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 16 Mar 2026 10:45:20 +0100, Bartosz Golaszewski wrote:
> NOTE: Each patch in this series can be picked up independently into
> maintainer trees.
> 
> CONFIG_OF_GPIO is a switch that enables the compilation of the gpiolib-of
> module. The module itself handles GPIO lookup via the OF-node tree and
> is automatically enabled on all OF systems. It does not export any
> public symbols to drivers. There is no reason for them to select or
> depend on it in Kconfig.
> 
> [...]

Applied, thanks!

[3/9] gpio: drop unneeded Kconfig dependencies on OF_GPIO
      https://git.kernel.org/brgl/c/7803501e5754dc4b295ab22b20562e2b965358ba

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

