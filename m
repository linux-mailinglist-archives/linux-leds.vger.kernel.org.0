Return-Path: <linux-leds+bounces-7320-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLXMIWEbtGlLhQAAu9opvQ
	(envelope-from <linux-leds+bounces-7320-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 15:12:49 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 885DB284A87
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 15:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D3E4309AE5C
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2026 13:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41481315D28;
	Fri, 13 Mar 2026 13:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KtbSMsLt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SObXtzdR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB8D1C860A
	for <linux-leds@vger.kernel.org>; Fri, 13 Mar 2026 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409457; cv=none; b=StAYom4JdMKZ+j+UgJpxXt5F5ZFNXJaJUfoJhZsZLa9euxScjUSEjezXwhEWDfkfWaFwZVI+1BGUOsWhQ7T7rSgUmX73n7Zxrx6bNGc4Ex4qS2UVY4sGHQbOXt3a9bCltFTPek+19sHSr0Mi+bXry5/0oZZDTCkEOnq7HssVBcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409457; c=relaxed/simple;
	bh=kPh4JRKsDotwPE2S/JesaTmap1N+yj7JN+2zbuQjdQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C3ClhtyJZ4scfwJVPJ2V/x7MLrlfIe3bf++fQX9BHcDOTpHNZkOLqSiFURkT+0e+lr0OFCObimPnmUObiY4lG8RJPTiTgcAH+A7vU3Sko7lHug1nay50N5omnfb2ozjkgBo6ljvw4w19BjvMWPko1XnCUM1xMYJvDThbCchq/fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KtbSMsLt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SObXtzdR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7JUSw240711
	for <linux-leds@vger.kernel.org>; Fri, 13 Mar 2026 13:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QoZHIkugLvxBFz6S6an3vh8XxLW2VljccTx776RcMfw=; b=KtbSMsLtNsll432M
	ZTzKQXe8T/DK/n7b9XjI6u2X8hEFxS6+vToHFGAIETMkOYmiyrVQx1Ron0HTNUGw
	L/7hqLNFcZtO+7ieK6wWqj/GrMcUMTkirbNDQOXKEyEzX++Y07x36vS4BckJkiBw
	i0e+TKFjJYkL6k4y12GD35M2kL8ToRgaS6v3aDis+sQW046oTfw6VRUKYvC55XyU
	GavC+gmfdoZZxfCSN9TNUX7z0/IKdGFuTV1BuxzhmfyaKB9OzNJ/1nmkV5iIg9BW
	H8cIWU+Z3DaF7xCU6hevUNHgxDD88Y9uGNl2srLPZ4lN68ffEs3Qj3IQtVVXyVOS
	oZVnQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cve3d9aw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 13 Mar 2026 13:44:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd849cd562so1384293785a.0
        for <linux-leds@vger.kernel.org>; Fri, 13 Mar 2026 06:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773409454; x=1774014254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoZHIkugLvxBFz6S6an3vh8XxLW2VljccTx776RcMfw=;
        b=SObXtzdRrSru9OolzC5msz8Pripq93dY0a0iM5lbQwBl+ye+xEBpdd4zQo+KyfwEDv
         IjVaqDl4PeUkPJvG9NwX5h06TTAtT63n6WvwVwhM3/ivwF63ScoL06ZURRW6dqXdKZw3
         5CqDqvwBW9+CYcgEb19Qe9Qujf2oeXMYF9I1H7eh5cHzc0gutftPuWgchOsDymzclPfV
         +5Lhm0zLaqsFJgg9Rqz21Pea1wWDDGoY6Jm6IuAHUBcIbIt+ne5itg+OeZYkFCYoKXdW
         pc/ZxLpoRUQaFJQZtj+pBhe1xWGmcUAJL9fwI3qJAf/EXjc6qcN05uNOVvpy/76y5nNd
         bn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409454; x=1774014254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QoZHIkugLvxBFz6S6an3vh8XxLW2VljccTx776RcMfw=;
        b=mJDIY1aygNmGa7Gkag42uYKIn/Z71ZfB2/E+H559OO4ZjbKUC5+H13a9bbn7flW2fL
         U9m2861mP8wquNg3beJusBv2vU9VXvwpo+3M1whgAXOleGO+z1kpvU35jPvbyMXOLUx7
         FXxvu9zozZhLJ04mAsGgG9+8hpF30A37cv2jaZycWk7pE6PxSDgEJaCKEyHBVPNd9QAx
         3hY0zg96AYxYoWw1jv8ZzyI3vQVxal2NuZ1xFVBPTQbubKOHTM6WsFIs4hgWp/N3FD5n
         1ScuNlOOPDfew0JyC0vt4MtDT4nrXLIEoIIt3FBPf1yFvOrqUTMcoVpcTYCiEllbyvAm
         oxVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDAYTGN85mvq+9R5rl4WCN5m56Z8Ial/3JpoCUWH5gaD4/AvFDqjTbHBpb9AusLf0suRm1pArH8qLu@vger.kernel.org
X-Gm-Message-State: AOJu0YwLiIYfxmu2e8ZkEx1lN43rzfihUf2Sjws5tgZwzfFJU37rN+Hz
	gX0xgP4281X6e+3wQsyH1LeBW+mME/W9EGwSmFp18qSyb3+80n7OHkBwptSqH98DZqHkwLnUQJH
	k0iy0LmBIHvumnLLocvoXZ/ysp5uVpBVQL8/Xt+HV1w4wiyQzKyJ9z/yL2ITgNXdB
X-Gm-Gg: ATEYQzzmzTJvuQdv7L+b5yFUoMp+z4FbAWjusc0AzI4z1a8HH0XyFwZCdjChwEH8JG/
	EvgwGrdNOfwpZexIFhJxmwlYjTl4JUDHLgDyWWs+/+8ACtu9vOMqiTDyu776YkWSA/tKAtqRAJ4
	0uOnx4gSJo84Q6HrZIv+GFYubSMNjRtw0A9FLYARaWYC8FIpcr8cmaS+VKKi5TF3V7NEL7XpcKq
	9S6oTjU/InhPHjjW5KdSCRKYArv+w8RlEyX5Rn8BjEATfk5hyni4HDiDnnYuxPeLAYlsU5bxlJj
	n1lfTyquNE9DPst4UU4f8zQSFnyScsbBiiYQcYyqqKQ/TOD3pZ/hgFHcEUuc2GSkGewryqXuFE7
	wxRy3H8qyicE0HNLYGX1zqjEULMC5VXh6MUT6ee5jnZ/GG079OIg=
X-Received: by 2002:a05:620a:4623:b0:8cd:8fb7:7aed with SMTP id af79cd13be357-8cdb5b5fb55mr457717085a.49.1773409453916;
        Fri, 13 Mar 2026 06:44:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:8cd:8fb7:7aed with SMTP id af79cd13be357-8cdb5b5fb55mr457712985a.49.1773409453455;
        Fri, 13 Mar 2026 06:44:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:f055:6536:e7d6:661c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b4dasm17696873f8f.18.2026.03.13.06.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:44:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH 00/14] gpio: remove uneeded Kconfig dependencies on OF_GPIO
Date: Fri, 13 Mar 2026 14:43:53 +0100
Message-ID: <177340937994.51547.9424773605486301589.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KStAe2Tl86cemZjIiPaFYluOYp9q1_jm
X-Authority-Analysis: v=2.4 cv=FLwWBuos c=1 sm=1 tr=0 ts=69b414ae cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5BVL746LnNak5i1nQvMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwOSBTYWx0ZWRfX656sFK2IZgzC
 O+NnP/IY4dDEsxr2DZ/PNwQFpZdNqN8UtNfQdN5zMlN4KpfdNYoQSx2mlfP8BWbQ1rU0Z9TY38G
 IPs+XWPYamkMbim3gM3Xwi8opMpvZh9WuY5RzjhfhgNmON4CarLyiJ8+8UxN8A5Xs8jGMPD4qOM
 eL8xeOqS6xmx5wYkpajp+6gMc3od3ilOIeZkyezXfpA+HJXlX3xuRQRRNcISOXFIdLylkf8Vvou
 SsHovfFaamkiAYvw+jM9QQm32ks2bJFDnvOSk8JdX47ub+zcsAi582XEsNbJ22VVnEZ3o5GROht
 n6YEbrGXYHK+Ik3jrwfFUGBcCOKLwebaJ42WGT5cEzDmwz00n9+kJ3DS8lp79vDcHlAJEVx3TH/
 EWepT2XXDz8Q0kQqlSmkTCJ9OirxF2Jv5LZaE6kSrnfjY5Ads7Yfb0bMne6balixe0f3w/PdZFV
 KCKmdbHYNbs+nAk9iBQ==
X-Proofpoint-GUID: KStAe2Tl86cemZjIiPaFYluOYp9q1_jm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130109
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7320-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,synopsys.com,buserror.net,linux.ibm.com,ellerman.id.au,gmail.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,redhat.com,linaro.org,baylibre.com,googlemail.com,tibbo.com,roeck-us.net,linux-watchdog.org,linuxfoundation.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[47];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 885DB284A87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 04 Mar 2026 10:02:21 +0100, Bartosz Golaszewski wrote:
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

I'm picking up the ones that were acked and will send a smaller series
addressing the issue pointed out by Guenter.

[02/14] arc: axs10x: drop unneeded dependency on OF_GPIO
        https://git.kernel.org/brgl/c/d2cd20f7c2a4e4bf4fca844c01e925b112c5a2c5
[03/14] powerpc: drop unneeded dependency on OF_GPIO
        https://git.kernel.org/brgl/c/dd1cdfb20e44e295512080dea508771b6a1f1c0a
[05/14] regulator: drop unneeded dependencies on OF_GPIO
        https://git.kernel.org/brgl/c/bf017304fce10933f18fafe140bf749fb9672058

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

