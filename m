Return-Path: <linux-leds+bounces-7356-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPs1D7XRt2n0VgEAu9opvQ
	(envelope-from <linux-leds+bounces-7356-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 10:47:33 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D42A1297530
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 10:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B29C301C567
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 09:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE2C38D69E;
	Mon, 16 Mar 2026 09:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlTloFLe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+HME7Xm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B6838F22D
	for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 09:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654349; cv=none; b=EuGbImWFhO3gie1Hr39cB8Ty3gTkp2DWfP58r5WP838BNpwr++NKciKbBLJvyzW2zGZ4d/Tlf33ibNxjkHSn3GmxAleMim63e/3ioF3XDyYiV6v3Wy8QGfjo1ICgHMCNV8x09bO/j06jP9TtClVLsx3zjWk+9VFGZSkiUoO0VTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654349; c=relaxed/simple;
	bh=HYhh5175MjWDCW3hz6XHSycHBy64wcX8wW09sbGX2gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Alwy1kdtR4QU/P1ouOE+s7oI4hpKSRbSA/+stcNnY2mV+6gjdKFZkvKhnJ/Svw6wU+LfGYm8fzfQhqGHojjbDxyNkjxWKG3MH6dSyrBJNcdSjjL+sAC/rPny5G0pbADZDbYvnzpm3F7WWY+gZo815h4sEKknwLWvEkLglTmvwBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlTloFLe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+HME7Xm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64gRf323594
	for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 09:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/me2wMiiolCP2vBwysex2L1/sOMs+/dHNx+CpVpgu5U=; b=nlTloFLeXHhd34SU
	KHEF07Cw4bHJjx4+NADFDDQK25xjWQN8q6A5ukg+f0T7kANvhLcVjo8x0IY8ksz4
	SkCe5/ki2c+E2Svz9nLH1uJukU3ByK5hgmJ4+3Cjfre8lRw42cgKEJ7pm27DfGBX
	0ApOLWMlmtnhE7pREydl4rEgsbNN4/Ci0Y8b+gsKIfEZZvtm6LFKC7x0YhEiLVGV
	eI4P/ujAeBoKSSTDnKxG64wWj0YMtVL/AkWKCaq6TeRjYk7quZeEw4TuOTcEnqCV
	lXQO3UIAmbcnj3bs+Mk7vwfZXtdv8Cehdq6lo8o3YY3x44uyPpAWyzTAVLuWl2Hq
	H+dyZg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qn6fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 09:45:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c4885814dso299984626d6.3
        for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 02:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654346; x=1774259146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/me2wMiiolCP2vBwysex2L1/sOMs+/dHNx+CpVpgu5U=;
        b=E+HME7Xm1njdm35DvXN3ilADzesxZjPmFQR7K+o2QQRarRq/NTckc1QhHPAvvtkdN3
         GnidETFqgAkSyCfxm76nwFP/nE763UDyoTLBJzxXokCZBDXAu6K7e+5BMXJJN+7L6FcF
         mhj2xB0kA0RGDgK6CaaNqxccOtqE9TdRVHBjfFias0ZzbiNS+DtOUrEtvyz24KIfSr66
         Ki7IFIeYCSAqpsbOg/2+5FIAeeHVoglyZ/G7yUQF400+lAR7GNqUqgg8xA++gmckbxx/
         l1qWiycW9C5ToGx/k+2MTfUardVXvVTFBU+VEV89GFaXwRSONITnl+97zIgSNzkYHZv3
         dAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654346; x=1774259146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/me2wMiiolCP2vBwysex2L1/sOMs+/dHNx+CpVpgu5U=;
        b=bqcoLBO512X0qoWsfmxkFR8lzdOITNc87Gh+0DkI+rwHE8StTpGazDLjfJz9NvGFsO
         t4V7SAFb9pWyHnXi83EOTyoYYsRFb6R748lTo2vaMmBZoQ1bObmftCcM576qV0i27tj2
         LB+uGRUD4xgezhzfkv2eEJIUrr49fg0nlSMi5M/qP13UjDYyZdTMZGlNiMvgyNG6ObPd
         nr+10UzglGKdSCnqI4HwZq93mVwfWDbIuMJNEE9pTo4857oM3Ums8yLqbvyNBpXI5PoU
         YXcOh6m9L4NGIZ7ylvQUIYE2vNqe/5JXVNwhqafLQyEg0LZogoyv7vh9yE34Qac+27tE
         zBgA==
X-Forwarded-Encrypted: i=1; AJvYcCVXFP+xbmFGRSGL/Jj4Q0zqieskSYJgWHkEH1gSeNem8XgpaB+z6uBFMNi0PO3ghRbbFgmPnc+nZx0o@vger.kernel.org
X-Gm-Message-State: AOJu0YzgsbZR+BiFOqyWgdPtEuEdipXTaZweS7q/SjJ78U5zpWlw53Rs
	I2eGiTqP5RgggmcDuMzM7kje3+6jpv0xsOtU6OYRl1GkVLJctXJp1i+GmXb0m2n8cWRJ3xshnwv
	FYodLImtK837e09oaUFWE0FbY0K13H6faaTPRuNQPWhBrGEoP3dl7ahD1I7zIXhv5
X-Gm-Gg: ATEYQzwFp1QHTh7x7uTqMeJ60UXt3qRXjG7tCf0hDKJhx4IZOXjl7LN4ZlFXYX1eh4e
	bvxRY5HDGAlT7Ury+FW86eV1QZpcasOK5o/Kxn6FM25EySFzUJdHffBCrxZB9YzEPOKk9W0yjxK
	yKoawZARjvjd8Gu96DREfXhG1Aa0FZ40m6lYqsBCPz5FltrFziF0UUlVmJEe0JDCLfw7/EvQX7S
	EQakhcsNPS2eDas5RQW3uOP7+JGm3BgjuzgfasJ5bRjJVCiDzQw7egJV+Qmh9yBl0FETO50rzY+
	xAsN5vhNvh+c9nWzx8C69a6U65DyzOtTxrMa6W1pduDURmskeR/7RwcmBCjoVdityDNNlClqZN0
	j+dUrbXPtMG6rFTnRuI5ZeZZjLF/EhCbdRLucNxKu+poUjC/G+Knm
X-Received: by 2002:a05:620a:1a03:b0:8cd:8889:227 with SMTP id af79cd13be357-8cdb5bdf07cmr1592979985a.73.1773654346427;
        Mon, 16 Mar 2026 02:45:46 -0700 (PDT)
X-Received: by 2002:a05:620a:1a03:b0:8cd:8889:227 with SMTP id af79cd13be357-8cdb5bdf07cmr1592976685a.73.1773654345997;
        Mon, 16 Mar 2026 02:45:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:22 +0100
Subject: [PATCH v2 2/9] net: mdio: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-2-de2f4b00a0e4@oss.qualcomm.com>
References: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
In-Reply-To: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
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
        Sebastian Reichel <sre@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=845;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HYhh5175MjWDCW3hz6XHSycHBy64wcX8wW09sbGX2gk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E6fJnMreFnmXzFZLhGkFMX3Zsbw1YGYTLK5
 r72IbihzNiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfROgAKCRAFnS7L/zaE
 w5VREACIACWA1TEOB3OkduZYg56RL8zQ+HZ6Oo/yVmrqQYlHjx25QRiQ2HPIcJJUzD/3LSnl5Az
 +CQjrdV2dnFfgYI0cfJ9o8p9YV1RGtqJcy+s0IbM01gIsppk09IuT1rSm4lrJc8uqe0aSp9ELSy
 UfT8wzgrIYj/AVf+j+w9WzR4VyzJony2Jd/gMvYeip/ndZ5lp+rdGjJmgO9rG95qPamh/V2up8w
 bJ8ucXvQHd7SoDqn3sl5sho1+xwrxd7XSSJsyDPIBazuuIi78vX4UD9m5Wf0Zk0ITqoC0btzxT2
 JrinwUMkNL42rcMRGtcE1M7j5sCO4D32hv2dx9/g6DRstSJhfFS0YuoAp9sJ7bAbhOYsMsgH3Hb
 iGrWSGNrsX3IFn0/Gon1aIDg0FpkjL9y4BjVz0FbY5A+SGZD1o5Nc5pcklxtWN4yEsRIxXw/7V9
 Pnjy7EKuWj1l9J/DgiYUZJn62N+H3hTVPzjnIIusYb5qsmQvhdCpEd7DLr4cc+Ph3zRmmvp7G+X
 uJIC32ILWINvVfp4ak7+VmGQRAuXyk1bE7WMCmskegYt1hmq9lMb+4LMUREytKZtMBNml+sXwiz
 P6ch0yS6NHRFKsXtzo0oGoJlAIns2XabXySwSwNCx2Xv+R0/UYkJxL9bt96Z7v6wiHsI0lTtHWS
 24r/N3M/aDxX2oQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: bFN4jKen49-mIcPPkUFhEILvtIQozyNC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX5P7CcWSzIq+k
 cQ8ADKi1f4fbsggGHbQlKpU24Y/R1ifvA+K+EOs5J3uRU2IuwYr4/tuwhQxaEE3ysaDMb2YhFQx
 KmnGxET2ylxPpTcitnR88VTxIValhUMmi3o+pQJMatYqPAKxoPij6DM7M0Nxvbi1/G1H21Px515
 Eptjq3LgXMlmd7LeozIgFHWBTGAl8+Rj33DiEQ+cFF/3n1MW3/5x8wR2GSzT4splH3/j5a25n/0
 a1yfE/cC0+InIjJfjcWe+CJb6YU7lbUqrgx432Tj2BJscZGo0ncpIXv+OE7PZLG5/Nw5GtQv2Ub
 79Qz7yPSjdix+lhGCR40hpe5UPNZiWhA6bL3T7Iv85ecHLbEgR+rCzbvwbr1bJnjs0YEkLSTnok
 00QsYK21w7hXlen+CH7EEhso2e2gBh3fsC774MTpIIoeSCryibGAY8TUnFE9Jk3qCAhgxf5rRem
 UOIyLVQmMjfBMRBwTcQ==
X-Proofpoint-ORIG-GUID: bFN4jKen49-mIcPPkUFhEILvtIQozyNC
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b7d14a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=wUbH2sL_sFSbtn_y6v8A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7356-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,redhat.com,linux-watchdog.org,roeck-us.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D42A1297530
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/mdio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index 44380378911b7d72e7289951fca90282d731913d..d7ca7fce7a3b86a435fac035534260146f114bc7 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -247,7 +247,7 @@ config MDIO_BUS_MUX_BCM_IPROC
 
 config MDIO_BUS_MUX_GPIO
 	tristate "GPIO controlled MDIO bus multiplexers"
-	depends on OF_GPIO && OF_MDIO
+	depends on OF_MDIO
 	select MDIO_BUS_MUX
 	help
 	  This module provides a driver for MDIO bus multiplexers that

-- 
2.47.3


