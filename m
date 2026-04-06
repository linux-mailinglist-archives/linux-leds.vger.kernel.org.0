Return-Path: <linux-leds+bounces-7642-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A8YHBzy02lxoQcAu9opvQ
	(envelope-from <linux-leds+bounces-7642-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Apr 2026 19:49:16 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3BD3A5E60
	for <lists+linux-leds@lfdr.de>; Mon, 06 Apr 2026 19:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4751302268A
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2026 17:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602A1388E5F;
	Mon,  6 Apr 2026 17:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRi3UKNl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VMSGFbqq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A14341062
	for <linux-leds@vger.kernel.org>; Mon,  6 Apr 2026 17:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775497608; cv=none; b=f/29j2tbovmyOiDYmN/y68dbp5GMAG+xGFMc6dPoRgrcesww1M6gsf9LvATIcKPj+T9OOsaeK+YonT655lr9uS8KV0Yjx0zE9Y2+lXL5Q5MtJYzqSO7w80T9o8y1rubGZAEszUAyWNtTmezpvIYqwEVJNuI5RED5IFAqBC5AkbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775497608; c=relaxed/simple;
	bh=v8gT6ChYVGCidG5PYw+FmtRLKgQY8s/yK//CC8Z78BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GmY4fB+6R3gJKEqBon9z3S2Vp9m75oxd48Q51xJYB85Sh7XqC+vY42F/iuzk4VYQTAMAnR8HRHQPsCWOlkXFR8if0DhxC+FTJdFUmlSBt7H8CcskvKEn5oQWmi0lKdNDC80JQaJooZZetUUNkZBm9BO1H6nB4x8iTLnOlEfZ0bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRi3UKNl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VMSGFbqq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636FPD5b2765384
	for <linux-leds@vger.kernel.org>; Mon, 6 Apr 2026 17:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5J1LEnO7Lx3oSEMFDv8aayqFtR5IHNRx2Z8
	gx3jDmVo=; b=bRi3UKNlxod/6i+yuhoHJiHvkvX6efI5S0Aj8SuE9seYg71QZFk
	Bb9TbQx9JvvrTGpE3qktNVZqssIgh+Z1CJESETU9nSLkFqpoIwPEe8SBz5mqjJ4J
	R6WxunP6Uc2BBMGeAgSDz5RuWfir8NjivpbFp47nSA+5Y+uliOTxzU3zHPuYC0wC
	btSu+l7rd1rslwB6iuJ13NgxcOcx/S7H10rqsurRnARWftJniBXk6DoG6BtNfCb6
	rtBSwxHfadToqHmsT/WbPVvKcjoEu35JgDF2/Pm9cOHcEiqt0bbSa7DwYdDBkKRk
	jOBK0WgdCXCFa/AA/UxHg2lmbbxyazg0Z/Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcff58fnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 06 Apr 2026 17:46:43 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-604eba0f2f8so1604038137.3
        for <linux-leds@vger.kernel.org>; Mon, 06 Apr 2026 10:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775497602; x=1776102402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5J1LEnO7Lx3oSEMFDv8aayqFtR5IHNRx2Z8gx3jDmVo=;
        b=VMSGFbqqTy5Co/LmH7OH8GDqc83jyqW/H/yB3DK1ftGOwAJUSDpu/xwZI/6prAve08
         JcZAlUyRWRG4QhUhZZoTfuA42nxknAJP8mhgrleDiMbbOIo0TznjeWctZY2M53k08LDG
         QW7cJG7mdBQpSgmGCpI3S7SfoufABeFv+UclOlaHvOFYRMiJMwFY9o1dAPP1WYJE/qBl
         7a5glKSMfHWvtMR1ZfNXI3KPU9fM8SP5cybtKxfRjuGAUgCPL6rZoMDLLlNei2w7rzYS
         QU2peH+BGxUNh1cxXlS/zq0GTz5RwIeVt9LH6Uk1WHcViWjhyYirduD3DlaAdshFacoQ
         V7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775497602; x=1776102402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5J1LEnO7Lx3oSEMFDv8aayqFtR5IHNRx2Z8gx3jDmVo=;
        b=LmrI9g4Q45fj1W8Gc4cKc52neH7YD1rHAc0hY/LWgTxyUEObBLRCe8UPw11jRLkk1q
         wHHHVvtKSDe1NTf/Xla64PAWuA/qmJifrFe8JHnxVqglvi6zl3iW3+TuCYkpE5IV/ex0
         TYYaCN3IjN5+SkJeHbc2kjlVJVJxVCDrwab4/jOvpk2WkdYnY6lt02CPz8BGirKC9AqJ
         FNq0d/tawkaGU2IwR/ROsotoCxpRyqxyY0YpRaGK0fJmBV0m5Y9414syy/HOwHPWrFmn
         CfPBBS/f/68TxCiiB2ekdi+s5RvoRnTlxnxUCn82WfgjWPaUq3lLjU43mYJpW6kSSKYW
         jkRg==
X-Forwarded-Encrypted: i=1; AJvYcCXAiC/BjhBngZtD91jdRPeigO5dfS2lsND1yrW3a4bJVAzDzkxr4TQ+EuH3SPx90ur8aaIr+MNz0Zv5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+fsLOI2K4ngN0yRDyLqOSkruvb0DONE/qhpH3eCSWnTBk2F8K
	Z4l/eGDlt6HhIi5H90WL0/YfBnhWPA9Lv6U7wxHlg/NwMy891HLJv1MKCnYfq0pWRRBMTFePaOr
	OY4smA852xJ31+LM76E+DFaSEZen0wPrQ8C3UqiG+Qndab1X2qulpt0cxFNJcXMTcIe0sfnZp
X-Gm-Gg: AeBDiet7MkzhL8FfJftUZrU7RLJT7BlRXAaZJgCA+V+/qM56P0Q6gc4/Fi6wUVyiB1d
	qt7IrQU5mwmiXP0beuvsZ8mShYea5gMztFZjHKg/HyzNMRlXyMqwseJzau4820g06M/S6UZWMzR
	We8F60lh91zK1JxF0+5qFb6PKlXcjLzeDpyOM0nyoUYYkFvYKzjJZZONl7TAXTA0j6UO5qklhCI
	9dA8sqgtjd6W5u0P6+X+oa8vjg/HLq+I5WNFB8ZWO6CtrJnQJome6c6K0s0HBJEUihA/TC2nSpL
	nn4ndT5+jMrbWPVapzvcu9/EzCMyXw+1wzAZI+rBlr5gmw6W2z0YdtxX9WBQkKVVf2F5fNedlwZ
	/XtfnEfZdh6e+rT7vaJpgwDIbMV+D+7koqfUkMcHhKXFGHBJhmXo8uPOCvubxt2byO7f5Azgb6J
	xj8vDL3hOUc+1dZgd8G7Fzks2+rpQJNRCx34pA
X-Received: by 2002:a05:6102:dc6:b0:5ff:ea39:dc7b with SMTP id ada2fe7eead31-605a50e18abmr3956734137.22.1775497601655;
        Mon, 06 Apr 2026 10:46:41 -0700 (PDT)
X-Received: by 2002:a05:6102:dc6:b0:5ff:ea39:dc7b with SMTP id ada2fe7eead31-605a50e18abmr3956679137.22.1775497600900;
        Mon, 06 Apr 2026 10:46:40 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff0a1esm483073866b.43.2026.04.06.10.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 10:46:39 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>,
        Edip Hazuri <edip@medip.dev>,
        =?UTF-8?q?Mustafa=20Ek=C5=9Fi?= <mustafa.eskieksi@gmail.com>,
        Xavier Bestel <xav@bes.tel>, linux-leds@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 0/1] Documentation: leds: leds-class: Document keyboard backlight LED class naming
Date: Mon,  6 Apr 2026 19:46:37 +0200
Message-ID: <20260406174638.320135-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE3NCBTYWx0ZWRfX7jyGkojItpxb
 wb5ZbmMRHk33GSryAAuGFY+lM9rlHuaFTk70SJuOQFOI4WiAt81U0TeMNgt46RF9yC2RYbLLQ2/
 wJq/YD8E9O3m7ne5XFhYCNRJLoSwK5K6g3HXdBesZyP6gxnSp77vL0TA03aJ1Jv4SjXkHeRDwWA
 5aLokPa374pJ8SCDU/3P6h9fuXG5UNFLyXWaH/uAD6rAIG7Q0h7BQTz0DDE+633A/4QFoKbNzT0
 i1+uL79EsU9xca41wg5vy7Az0vbiG/YNRknEIz4NWfPskShxz5Pi2r2vRYq/kZEV7CZVkyCBULE
 VLllqSpzQ+hDNx2Op1wDOaV8vwNzao9muAG7fb8HgikdiSTtA6uu5piZbN1YJ71voXbAcljI2u8
 dO7BIQJBPfDTx3nv6DXRaI8u4ks01Opi11Pk7HvhnAzptqYKRL+M557A3BC0gHpje51gG6zAgz1
 jRZjFb84Qeszqd2ySkQ==
X-Authority-Analysis: v=2.4 cv=RNe+3oi+ c=1 sm=1 tr=0 ts=69d3f183 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=9P2F5LBCuBIzmV2R0jgA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: lX0Fa6eHboRQeMJQV5RV9GSLebXYxyWj
X-Proofpoint-ORIG-GUID: lX0Fa6eHboRQeMJQV5RV9GSLebXYxyWj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,medip.dev,bes.tel,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7642-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A3BD3A5E60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

Over the last couple of years there have been several attempts to add
upstream kernel support for controlling keyboard backlights consisting of
a small number of backlight zones, think e.g. : "main", "cursor" and
"keypad" zones.

All of these attempts have gotten or are stuck on the lack of consensus on
a userspace API (1) for controlling such zoned keyboard backlights.

Previous discussion can be summarized as there being consensus that
these backlights should be represented as (multi-color) LED class devices
with one LED class device per zone, mirroring the existing use of
a LED class device for controlling single zone keyboard backlights.

The only thing which really still needs to be agreed upon is a naming
scheme for the per zone LED class devices so that userspace can detect:

1. That the function of these is to control a zoned keyboard backlight.
2. How to group the per zone devices together for a single keyboard.

The single patch in this series documents the currently undocumented naming
scheme for single zone keyboard backlights and extends this with a naming
scheme to use for multi-zone keyboard backlights.

This is send out as a separate patch rather then as part of a series
implementing this in the hope to get multiple drivers which are in
the process of being upstreamed unstuck wrt the LED class naming problem.

Drivers which need this are:

1. HP WMI laptop driver Omen gaming keyboards backlight control support:
First 2023 attempt:
https://lore.kernel.org/platform-driver-x86/20230131235027.36304-1-rishitbansal0@gmail.com/
Later 2024 attempt which includes an earlier version of this doc patch:
https://lore.kernel.org/platform-driver-x86/20240719100011.16656-1-carlosmiguelferreira.2003@gmail.com/
Current ongoing 2026 attempt:
https://lore.kernel.org/platform-driver-x86/20260304105831.119349-3-edip@medip.dev/

2. Casper Excalibur laptop driver (inc. multi-zone kbd backlight control):
https://lore.kernel.org/platform-driver-x86/20240806205001.191551-2-mustafa.eskieksi@gmail.com/
This one unfortunately seems to have stalled.

3. Logitech G710/G710+ gaming keyboards HID driver:
https://lore.kernel.org/linux-input/20260402075239.3829699-1-xav@bes.tel/
Posted a week ago, needs an agreement on the LED class dev naming scheme
to continue.

Regards,

Hans


1) The lack of such an API may not always have been the sole reason these
drivers have gotten stuck, but it was always a factor.


Carlos Ferreira (1):
  Documentation: leds: leds-class: Document keyboard backlight LED class
    naming

 Documentation/leds/leds-class.rst | 63 +++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

-- 
2.53.0


