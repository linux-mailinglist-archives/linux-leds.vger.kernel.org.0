Return-Path: <linux-leds+bounces-5590-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CA5B9E25B
	for <lists+linux-leds@lfdr.de>; Thu, 25 Sep 2025 10:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28BBA4C31D5
	for <lists+linux-leds@lfdr.de>; Thu, 25 Sep 2025 08:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84E927877D;
	Thu, 25 Sep 2025 08:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7IzIFfg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3358D277CB2
	for <linux-leds@vger.kernel.org>; Thu, 25 Sep 2025 08:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758790583; cv=none; b=bP6dxBZc5ZtneGpO6vPDVApgoDRhsPwEzXezCZ7K4kr26MtJs+n7lPO8EONP8BTRrvqzrtBHNcE5yqIPiCdFXsLvcj32wHIvo7UTTkQ5zUZVXhhLGBLDYPoIwSiZWqSW1e2pQKNK1BHKQ4LbRgjFN3h6pZCXsuz3AWmffUhTsaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758790583; c=relaxed/simple;
	bh=mfBuiVc1jTrNnBpkc5m0CUezfJaYbkMF3CihobTqPNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GF8H/om6l9n4GRGyN4aqhf/Isp5IV4kPxk5OcfUfbWKshGaqI0yq/G3flRoyQzrZRnzSDJQ3wyVAxZIouXVTyU1GmhcIYZJhCetEQWODF31ZP9M6wvOPFPjViKZeSg3igzZ4opg2z5M+mQtHkMh71G1j4RAQqQJ5uq24BUztIRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7IzIFfg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0mP0p029712
	for <linux-leds@vger.kernel.org>; Thu, 25 Sep 2025 08:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MyjBhb2r/gU69fmaCmZ9Ifgn+LhunjwusqmSUhFSlqQ=; b=H7IzIFfgCOJyK1b7
	3oIvxiWtBbOozTBiscC8shuYKwGgMy06PMjokEx58soMCQv4XlpK84L+atmXamPb
	yRbal4CIQL8zhDX7vG53lyD0KRTWGGEcRENGP4lqjek/+DUPNiyenRlze9kRfjhX
	FqB7mEH0acP3v6CLFYNFmqLD7jRlvUYiTxEDqu5us7DSd2JwvhhYtxfSHlR3ZeIf
	Y1Y/0kE5z+8vWWnRSsQs4WS/Cl339iOqEd6MZ8cqFq0CrCkJWBRfOzLtH3QZEXPT
	HNwycXhCrtwp0xX9i0XlOVPR88gmE8OVWNRBoz/uUYEElC1broCTnjj7/n8YXg1k
	sAKtmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fqbfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 25 Sep 2025 08:56:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85e95d986e2so389385a.1
        for <linux-leds@vger.kernel.org>; Thu, 25 Sep 2025 01:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790580; x=1759395380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MyjBhb2r/gU69fmaCmZ9Ifgn+LhunjwusqmSUhFSlqQ=;
        b=wbUBkQMyiprVA1aBSpeKnVA2Qagax/P/3sjl5GjiPMvaPLnkWEWYIgheLhXiKrmJ0r
         Zqb4ak+7oHxtKOfe4LTELL2z1zvyJs8birS2WMDEhARJHWWbzhfBeRmQUfLJi9j8ifZO
         +D5o+/wJBrtHv4+AleW6iSyo8IcInA4IIi93sBmM3wmylkxhyN6+nZGHTslAKeR0GPCx
         UM5C3JWyQmxy5DxFSxcIVWLCBrJw4NIJid16FQQcz48C+Nt07tirvcOfEL6XxeDvZwjv
         kxL1vpwpZTmC5RVzxscQMG4TolkGK02smj90V8pjRrrg1l2GEWpRMcuk0HSSe0zebbMU
         lI9g==
X-Gm-Message-State: AOJu0Yxv0WtJgsJVDUV+DID2px4feW1ZnBs6cWMhxilmxRhdTyuEWNtm
	qttluWRAUJRLf/lpCmtj+pbClpUwTCbPrRvxH4eln8TotHweFWgbR4mgUlxeQV2waMgVq1nA6Pm
	EqQUO+jPJrgDoVES3ot+wvHNqZnR6fHhWiQ7h8cVdTBtKNViz6jtQPj9WXOssS7AM
X-Gm-Gg: ASbGncuovVhCBBSTPxvzxK0Il1gMUaj26AEFaWyEjKvw6Sw0kffTqHRd+a8dWyh3Rvr
	VW54pFM7E4Tfwi2nqQdnxVUs8//WddaX/nvaofR3pSyMzg/J+q0ZSn/MAQRnvbFZh74W1Hek5by
	6vjJQz9yxwkOM6luwGDiDUNrnNFqumt7wYCNiNyQg+5+73sRcxrH5x609YanlRZhj6yGBmizCBB
	SeWqlCn8KikCsnF9s2aA3FvphYcYP3lETrW7xdHWK/O16GBaDK3vi35upI2IsiwWUitvFkDAU5o
	kNswDrM0XLJ5hGtR57oT+9OrOmWTdiRn3Uvt3iqaSdxfn5xDXnxSEl8BXyBPwh3uG4SUswgbvs8
	du34hpMQ06wQhWBflD4XJig==
X-Received: by 2002:a05:620a:2946:b0:827:d72a:7b45 with SMTP id af79cd13be357-85aeba1f4b1mr214524685a.12.1758790579917;
        Thu, 25 Sep 2025 01:56:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvIE5OPFID+YJREvS0boNYXOcv2oaoxwC5+Hv9MQUwY7sobh6xykrZTLcHUGRL/Jq8V+GX/A==
X-Received: by 2002:a05:620a:2946:b0:827:d72a:7b45 with SMTP id af79cd13be357-85aeba1f4b1mr214522685a.12.1758790579433;
        Thu, 25 Sep 2025 01:56:19 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3539347676sm127658066b.0.2025.09.25.01.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:56:18 -0700 (PDT)
Message-ID: <c85c00b4-cd73-4672-8a9d-8c97aa0094d2@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 10:56:16 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] dt-bindings: leds: Add bindings for Kaanapali PMIC
 peripherals
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20250924-knp-pmic-peri-v2-0-32316039db2f@oss.qualcomm.com>
 <e06694ec-41a9-4d31-9fd7-8f24f6aa17ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e06694ec-41a9-4d31-9fd7-8f24f6aa17ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CgU2TUNLyhY9OrX16sfR_x2K585U2C8h
X-Proofpoint-GUID: CgU2TUNLyhY9OrX16sfR_x2K585U2C8h
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d503b5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=cUfx7Bp6FHvb-ErLiqwA:9
 a=QEXdDO2ut3YA:10 a=UzISIztuOb4A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX9Hy8kLMXzGMh
 lc15j/0PPxh0jzavL9LkjnPinsIDJH/37G3bVd9EMRkSRfmQskIHCSGMfjmJykZ7m+23zwCA+9J
 6pUNvl6dTpl8qPryEcT3Y1ULiHJ9Ng1/aVWmz0h/8x4HXUfR4z1yPOxceZnwapgLnIHGzrK/fOP
 NRlflGugkLvICBAu5ZE9N4ZKil3uMrTyehQBSEm0q3ZDvPRYtIHCZedsUOpAXC+V0kG44qbwHNw
 h/5UNlqToEPAY9nDVTasG0H2F8wwjFXDAXDKMHg/vfUQe8UqfRa+wwNKkimqnRkVuGqIXO7utwz
 Z35Ue8JcVKlj2gkKOCGZitf3sOJegPI7NYu24ub9aWM6qllLlM4MLdf4+4OwvwS+gg7HIRZSjOR
 EYexLILG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On 9/25/25 1:55 AM, Jingyi Wang wrote:
> this was accidentally sent twice, please ignore this.
> 
> Thanks, Jingyi

No issues. When sending a follow-up, please make sure you'll send
a *v3* (so that two parallel v2s don't show up on LKML, confusing
tooling)

Konrad

